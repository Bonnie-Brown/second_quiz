class Idea < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :body, presence: true

    has_many :reviews, dependent: :destroy
    belongs_to :user
end
