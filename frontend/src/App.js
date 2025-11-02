import React, { useState, useEffect, useRef } from "react";

function App() {
  const [messages, setMessages] = useState([
    { sender: "bot", text: "Xin chào 👋! Tôi có thể giúp gì cho bạn hôm nay?", time: new Date() },
  ]);
  const [input, setInput] = useState("");
  const [loading, setLoading] = useState(false);
  const chatRef = useRef(null);

  // 🕒 Tự cuộn xuống cuối khi có tin nhắn mới
  useEffect(() => {
    chatRef.current?.scrollTo({
      top: chatRef.current.scrollHeight,
      behavior: "smooth",
    });
  }, [messages]);

  // 🧠 Gửi tin nhắn đến backend
  const handleSend = async () => {
    if (!input.trim()) return;
    const userMsg = { sender: "user", text: input, time: new Date() };
    setMessages((prev) => [...prev, userMsg]);
    setInput("");
    setLoading(true);

    try {
      const response = await fetch("http://127.0.0.1:8000/api/chat/", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          message: input,
          customer_id: 1,
          session_id: "frontend-test",
        }),
      });

      const data = await response.json();
      if (response.ok && data.reply) {
        setMessages((prev) => [
          ...prev,
          { sender: "bot", text: data.reply, time: new Date() },
        ]);
      } else {
        setMessages((prev) => [
          ...prev,
          { sender: "bot", text: "❌ Lỗi khi nhận phản hồi từ máy chủ.", time: new Date() },
        ]);
      }
    } catch (err) {
      setMessages((prev) => [
        ...prev,
        { sender: "bot", text: "⚠️ Không thể kết nối đến server.", time: new Date() },
      ]);
    } finally {
      setLoading(false);
    }
  };

  const handleKeyPress = (e) => e.key === "Enter" && handleSend();

  const formatTime = (date) => {
    const d = new Date(date);
    return d.toLocaleTimeString([], { hour: "2-digit", minute: "2-digit" });
  };

  return (
    <div className="flex items-center justify-center min-h-screen bg-gradient-to-b from-indigo-50 to-indigo-100">
      <div className="w-full max-w-lg bg-white shadow-2xl rounded-2xl p-5 border border-indigo-100">
        <h1 className="text-2xl font-bold text-center text-indigo-600 mb-4">
          🎟️ Sport Ticket Chatbot
        </h1>

        {/* 💬 Khung chat */}
        <div
          ref={chatRef}
          className="h-[480px] overflow-y-auto border rounded-xl p-3 bg-gray-50 mb-4"
        >
          {messages.map((msg, i) => (
            <div
              key={i}
              className={`flex my-2 items-end ${
                msg.sender === "user" ? "justify-end" : "justify-start"
              }`}
            >
              {/* Avatar */}
              {msg.sender === "bot" && (
                <div className="w-8 h-8 rounded-full bg-indigo-500 text-white flex items-center justify-center mr-2 text-sm font-bold">
                  🤖
                </div>
              )}

              <div
                className={`px-4 py-2 rounded-2xl text-sm max-w-[80%] shadow ${
                  msg.sender === "user"
                    ? "bg-indigo-500 text-white rounded-br-none"
                    : "bg-gray-200 text-gray-800 rounded-bl-none"
                }`}
              >
                {msg.text}
                <div
                  className={`text-[10px] mt-1 opacity-70 text-right ${
                    msg.sender === "user" ? "text-gray-100" : "text-gray-500"
                  }`}
                >
                  {formatTime(msg.time)}
                </div>
              </div>

              {msg.sender === "user" && (
                <div className="w-8 h-8 rounded-full bg-gray-400 text-white flex items-center justify-center ml-2 text-sm font-bold">
                  🧑
                </div>
              )}
            </div>
          ))}

          {loading && (
            <div className="flex items-center gap-2 text-gray-400 text-sm italic animate-pulse mt-2">
              <span>🤔 Đang xử lý...</span>
            </div>
          )}
        </div>

        {/* 🧾 Nhập tin nhắn */}
        <div className="flex gap-2">
          <input
            type="text"
            value={input}
            onChange={(e) => setInput(e.target.value)}
            onKeyDown={handleKeyPress}
            placeholder="Nhập tin nhắn..."
            className="flex-1 border rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-400"
          />
          <button
            onClick={handleSend}
            disabled={loading}
            className="bg-indigo-500 hover:bg-indigo-600 text-white px-4 py-2 rounded-lg transition disabled:bg-gray-400"
          >
            Gửi
          </button>
        </div>
      </div>
    </div>
  );
}

export default App;
