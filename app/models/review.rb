class Review < ApplicationRecord
  belongs_to :idea
  validates :body, length: {minimum: 1, maximum: 200}
end
