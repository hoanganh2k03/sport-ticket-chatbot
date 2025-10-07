import os
from django.conf import settings
from chatbot.models import Match, Team, SectionPrices, Sections, Promotions, PromotionDetails
from langchain.embeddings import OpenAIEmbeddings
from langchain.vectorstores import FAISS
from langchain.docstore.document import Document

OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")
INDEX_PATH = os.path.join(settings.BASE_DIR, "chatbot", "faiss_index")

def build_faiss_index() -> None:
    """Tạo FAISS index từ dữ liệu trong database."""
    matches = (
        Match.objects.select_related("team_1", "team_2")
        .prefetch_related("sectionprices_set__section")
        .order_by("match_time")
    )

    docs = []
    for m in matches:
        match_name = f"{m.team_1.team_name} vs {m.team_2.team_name}"
        section_prices = SectionPrices.objects.filter(match=m).select_related("section")

        for sp in section_prices:
            section = sp.section.section_name
            price = int(sp.price)
            seats = sp.available_seats

            promo_detail = (
                PromotionDetails.objects.filter(match=m, section=sp.section)
                .select_related("promo")
                .first()
            )
            promo_text = ""
            if promo_detail and promo_detail.promo and promo_detail.promo.status == 0:
                promo = promo_detail.promo
                if promo.discount_type == "percentage":
                    promo_text = f", khuyến mãi {promo.promo_code}: giảm {int(promo.discount_value)}%"
                else:
                    promo_text = f", khuyến mãi {promo.promo_code}: giảm {int(promo.discount_value):,}đ"

            text = f"Trận {match_name}, khu vực {section}, giá {price:,}đ, còn {seats} chỗ{promo_text}."
            docs.append(Document(page_content=text))

    if not docs:
        print("⚠️ Không có dữ liệu nào để tạo FAISS index.")
        return

    embeddings = OpenAIEmbeddings(model="text-embedding-3-small", openai_api_key=OPENAI_API_KEY)
    vectorstore = FAISS.from_documents(docs, embeddings)
    vectorstore.save_local(INDEX_PATH)
    print(f"✅ FAISS index đã được tạo và lưu tại {INDEX_PATH}")


def find_match_info(user_message: str, k: int = 3) -> str | None:
    """Tìm dữ liệu liên quan trong FAISS (RAG)."""
    if not os.path.exists(INDEX_PATH):
        print("⚠️ FAISS index chưa tồn tại, đang tạo mới...")
        build_faiss_index()

    embeddings = OpenAIEmbeddings(model="text-embedding-3-small", openai_api_key=OPENAI_API_KEY)
    db = FAISS.load_local(INDEX_PATH, embeddings, allow_dangerous_deserialization=True)
    results = db.similarity_search(user_message, k=k)

    if not results:
        return None

    return "\n".join([r.page_content for r in results])
