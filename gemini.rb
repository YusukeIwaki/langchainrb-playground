require 'langchain'

llm = Langchain::LLM::OpenAI.new(
  api_key: ENV['GEMINI_API_KEY'],
  llm_options: {
    uri_base: 'https://generativelanguage.googleapis.com/v1beta/openai',
  },
  default_options: {
    chat_model: ENV['GEMINI_MODEL'] || 'gemini-1.5-flash-latest',
  },
)

messages = [
  { role: 'system', content: 'You are a professional Ruby programmer.' },
  { role: 'user',   content: 'こんにちは' },
  { role: 'system', content: 'こんにちは、どのようにお手伝いできますか？' },
  { role: 'user',   content: 'How can we build DSL for server configuration?' }
]

response = llm.chat(messages: messages)

puts response.chat_completion
