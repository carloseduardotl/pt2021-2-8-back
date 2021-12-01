class Comment < ApplicationRecord
  validates :description, presence: true
  belongs_to :post
  belongs_to :user
  has_many :replies, through: :reports
end
