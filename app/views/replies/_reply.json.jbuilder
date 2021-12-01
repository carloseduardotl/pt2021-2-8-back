json.extract! reply, :id, :description, :user_id, :comment_id, :created_at, :updated_at
json.url reply_url(reply, format: :json)
