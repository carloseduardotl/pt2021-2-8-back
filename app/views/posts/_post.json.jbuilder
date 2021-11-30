json.extract! post, :id, :name, :content, :views, :banner_image, :created_at, :updated_at
json.url post_url(post, format: :json)
