class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  has_many :comments, through: :report
end
