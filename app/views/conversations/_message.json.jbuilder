# frozen_string_literal: true

json.url conversation_url(conversation)

json.message do
  last_message = conversation.messages.last

  json.body      last_message.body
  json.date_sent last_message.created_at
  json.read_at   last_message.read_at

  json.sender do
    json.image last_message.sender&.image || image_pack_path('user.jpg')
    json.name last_message.sender&.name || 'Former user'
  end
end
