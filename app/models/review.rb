class Review < ApplicationRecord
  belongs_to :idea
  belongs_to :user
  validates :body, length: {minimum: 1, maximum: 200}
end
