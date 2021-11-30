class Contact < ApplicationRecord
    validates :email, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :name, presence: true
    validates :description, presence: true
end
