import os
import django
import time
# trỏ đến settings Django
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "backend.settings")
django.setup()

from chatbot.services.db_service import build_chroma_index
start_time = time.time()  
print("🔁 Rebuilding Chroma index...")
build_chroma_index()
end_time = time.time() 
elapsed = end_time - start_time
print(f"✅ Done rebuilding Chroma index. Thời gian: {elapsed:.2f} giây.")
print("✅ Done rebuilding Chroma index.")
