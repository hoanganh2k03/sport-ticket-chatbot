"""
# chatbot/signals.py
from django.db.models.signals import post_save, post_delete
from django.dispatch import receiver
from chatbot.models import Match, SectionPrices, PromotionDetails
from chatbot.services.db_service import build_chroma_index

@receiver([post_save, post_delete], sender=Match)
@receiver([post_save, post_delete], sender=SectionPrices)
@receiver([post_save, post_delete], sender=PromotionDetails)
def update_chroma_index(sender, **kwargs):
    Khi có thay đổi ở Match / SectionPrices / PromotionDetails
    → cập nhật lại Chroma Index.
    print(f"🔄 Dữ liệu thay đổi ở bảng {sender.__name__} → Cập nhật Chroma index...")
    try:
        build_chroma_index()
        print("✅ Chroma index đã được đồng bộ.")
    except Exception as e:
        print(f"⚠️ Lỗi khi cập nhật Chroma index: {e}")
"""