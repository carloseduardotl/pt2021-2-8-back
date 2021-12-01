class Comment < ApplicationRecord
  validates :description, presence: true
  belongs_to :post
  belongs_to :user
end
