from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

from .models import ChatHistory, Customer
from .serializers import ChatHistorySerializer
from .services.faq_service import get_faq_answer
from .services.db_service import find_match_info
from .services.nlp_service import generate_ai_response


class ChatbotAPIView(APIView):
    """
    Chatbot Hybrid: FAQ → RAG (FAISS) → OpenAI GPT
    """

    def post(self, request):
        user_message = request.data.get("message", "").strip()
        customer_id = request.data.get("customer_id")
        session_id = request.data.get("session_id")

        if not user_message:
            return Response(
                {"error": "Thiếu nội dung tin nhắn."},
                status=status.HTTP_400_BAD_REQUEST,
            )

        # 1️⃣ Xác định khách hàng (nếu có)
        customer = None
        if customer_id:
            try:
                customer = Customer.objects.get(customerid=customer_id)
            except Customer.DoesNotExist:
                customer = None

        # 2️⃣ Thử tìm câu trả lời trong FAQ
        answer = get_faq_answer(user_message)

        # 3️⃣ Nếu không có trong FAQ → tìm dữ liệu từ FAISS (RAG)
        if not answer:
            context = find_match_info(user_message)
            answer = generate_ai_response(
            user_message,
            customer=customer,
            session_id=session_id,
            context=context,
            )

        return Response({"reply": answer}, status=status.HTTP_200_OK)
