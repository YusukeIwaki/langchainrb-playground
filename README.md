# langchainrb のサンプル

https://github.com/patterns-ai-core/langchainrb

## OpenAI API

公式のもので十分

```ruby
llm = Langchain::LLM::OpenAI.new(api_key: ENV["OPENAI_API_KEY"])
```

## Azure OpenAI

公式のものでは微妙。
ruby-openai は Azure OpenAI に対応しているため、それを使う。

```ruby
llm = Langchain::LLM::OpenAI.new(
  api_key: ENV['AZURE_OPENAI_API_KEY'],
  llm_options: {
    api_type: :azure,
    api_version: ENV['AZURE_OPENAI_API_VERSION'],
    uri_base: ENV['AZURE_OPENAI_ENDPOINT_URL'],
  }
)
```

```
export AZURE_OPENAI_API_VERSION="2024-08-01-preview"
export AZURE_OPENAI_ENDPOINT_URL="https://YOUR_DOMAIN.openai.azure.com/openai/deployments/YOUR_MODEL_DEPLOYEMENT_ID"
```

## Gemini

公式のものだと、content ではなく parts を使わないといけないなど、ありがたみが薄い。
[OpenAI 互換](https://ai.google.dev/gemini-api/docs/openai?hl=ja)のエンドポイントを使用する。

```ruby
llm = Langchain::LLM::OpenAI.new(
  api_key: ENV['GEMINI_API_KEY'],
  llm_options: {
    uri_base: 'https://generativelanguage.googleapis.com/v1beta/openai',
  },
  default_options: {
    chat_model: ENV['GEMINI_MODEL'] || 'gemini-1.5-flash-latest',
  },
)
```
