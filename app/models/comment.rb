class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :city

  validates :body, presence: true
end
