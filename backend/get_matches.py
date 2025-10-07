import os
import django

# 1️⃣ Thiết lập Django environment
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'backend.settings')
django.setup()

# 2️⃣ Import model và serializer
from chatbot.models import Match
from chatbot.serializers import MatchSerializer
from rest_framework.renderers import JSONRenderer

# 3️⃣ Lấy tất cả match
matches = Match.objects.all()

# 4️⃣ In ra thông tin cơ bản
print("=== Match List ===")
for m in matches:
    print(f"Match ID: {m.match_id}, Team 1: {m.team_1.team_name}, Team 2: {m.team_2.team_name}, Time: {m.match_time}")

# 5️⃣ In ra JSON nếu muốn
serializer = MatchSerializer(matches, many=True)
json_data = JSONRenderer().render(serializer.data)
print("\n=== JSON Output ===")
print(json_data.decode('utf-8'))
