# chatbot/services/chroma_service.py
import os
from django.conf import settings
from langchain_chroma import Chroma
from langchain_huggingface import HuggingFaceEmbeddings
from langchain.docstore.document import Document
from chatbot.models import Match, SectionPrices, PromotionDetails
import shutil,time
CHROMA_PATH = os.path.join(settings.BASE_DIR, "chatbot", "chroma_index")

embeddings = HuggingFaceEmbeddings(model_name="sentence-transformers/paraphrase-multilingual-MiniLM-L12-v2")

def build_chroma_index():
    # 🧹 Xoá index cũ nếu có
    if os.path.exists(CHROMA_PATH):
        db = Chroma(persist_directory=CHROMA_PATH, embedding_function=embeddings)
        try:
            if hasattr(db, "reset_collection"):
                db.reset_collection()
                print("✅ Đã reset toàn bộ dữ liệu trong collection.")
            else:
                print("⚠️ Phiên bản Chroma hiện tại chưa hỗ trợ .reset_collection().")
        except Exception as e:
            print(f"⚠️ Lỗi khi reset collection: {e}")

        
    matches = (
        Match.objects.select_related("team_1", "team_2", "league__sport_type")
        .prefetch_related("sectionprices_set__section")
    )

    docs = []
    for m in matches:
        match_id=m.match_id
        match_name = f"{m.team_1.team_name} vs {m.team_2.team_name}"
        match_time = m.match_time.strftime('%H:%M %d/%m/%Y')

        league_name = m.league.league_name if m.league else "Không xác định"
        sport_type = m.league.sport_type.sport_type_name if m.league and m.league.sport_type else "Không xác định"

        # Duyệt qua từng khu vực trong sân
        for sp in SectionPrices.objects.filter(match=m).select_related("section"):
            section = sp.section.section_name
            price = int(sp.price)
            seats = sp.available_seats

            # Xác định trạng thái vé
            status = "còn vé" if seats > 0 else "hết vé"

            # Kiểm tra khuyến mãi
            promo_detail = (
                PromotionDetails.objects.filter(match=m, section=sp.section)
                .select_related("promo")
                .first()
            )

            promo_text = ""
            if promo_detail and promo_detail.promo and promo_detail.promo.status == 0:
                promo = promo_detail.promo
                promo_text = (
                    f", khuyến mãi {promo.promo_code}: giảm {promo.discount_value}%"
                    if promo.discount_type == "percentage"
                    else f", khuyến mãi {promo.promo_code}: giảm {int(promo.discount_value):,}đ"
                )

            # Text mô tả đầy đủ
            text = (f"match_id {match_id}, "
                f"Giải {league_name} ({sport_type}), "
                f"Trận {match_name}, Thời gian diễn ra {match_time}, "
                f"Khu vực {section}, giá {price:,}đ, {status}{promo_text}, còn {seats} chỗ."
            )
            
            docs.append(Document(page_content=text,metadata={
        "match_id": m.match_id }))
            
    if not docs:
        print("⚠️ Không có dữ liệu để tạo index.")
        return
    db = Chroma.from_documents(docs, embedding=embeddings, persist_directory=CHROMA_PATH)
    print(f"✅ Chroma index đã được tạo tại {CHROMA_PATH}")




def search_chroma(user_message: str, k: int = 3):
    build_chroma_index()
    """Truy vấn dữ liệu gần nhất trong Chroma."""
    db = Chroma(persist_directory=CHROMA_PATH, embedding_function=embeddings)
    results = db.similarity_search(user_message, k=k)
    print(results)
    if not results:
        return None
    top_match_id = results[0].metadata.get("match_id")
    context_text = "\n".join([r.page_content for r in results])

    return context_text, top_match_id
