class Report < ApplicationRecord
  belongs_to :reply
  belongs_to :comment
end
