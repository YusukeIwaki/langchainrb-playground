require 'langchain'

llm = Langchain::LLM::OpenAI.new(
  api_key: ENV['AZURE_OPENAI_API_KEY'],
  llm_options: {
    api_type: :azure,
    api_version: ENV['AZURE_OPENAI_API_VERSION'],
    uri_base: ENV['AZURE_OPENAI_ENDPOINT_URL'],
  }
)

messages = [
  { role: 'system', content: 'You are a professional Ruby programmer.' },
  { role: 'user',   content: 'こんにちは' },
  { role: 'system', content: 'こんにちは、どのようにお手伝いできますか？' },
  { role: 'user',   content: 'How can we build DSL for server configuration?' }
]

response = llm.chat(messages: messages)

puts response.chat_completion
