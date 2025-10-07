import os
from openai import OpenAI
from chatbot.models import ChatHistory
from .db_service import find_match_info

client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))

def generate_ai_response(user_message: str, customer=None, session_id=None, context=None) -> str:
    """Chatbot sinh phản hồi dựa trên dữ liệu từ DB + ngữ cảnh FAISS."""
    try:
        system_prompt = (
            "Bạn là chatbot hỗ trợ khách hàng đặt vé thể thao. "
            "Trả lời thân thiện, dễ hiểu và chỉ dựa trên dữ liệu thật bên dưới.\n\n"
        )

        # Ghép FAISS context (nếu có)
        user_prompt = f"Dữ liệu liên quan:\n{context or 'Không có dữ liệu phù hợp.'}\n\nNgười dùng hỏi: {user_message}"

        response = client.chat.completions.create(
            model="gpt-4o-mini",
            messages=[
                {"role": "system", "content": system_prompt},
                {"role": "user", "content": user_prompt},
            ],
            max_tokens=250,
        )

        answer = response.choices[0].message.content.strip()

        ChatHistory.objects.create(
            customer=customer,
            user_message=user_message,
            bot_response=answer,
            session_id=session_id,
        )

        return answer

    except Exception as e:
        return f"Lỗi khi gọi AI: {e}"
