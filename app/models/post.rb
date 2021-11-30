class Post < ApplicationRecord
    has_one_attached :banner_image
    has_many :post_has_tags
    has_many :tags, through: :post_has_tags
    has_rich_text :content
end
