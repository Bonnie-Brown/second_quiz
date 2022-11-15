class Idea < ApplicationRecord
    
    # Validations
    validates :title, presence: true, uniqueness: true
    validates :body, presence: true

    # Associations
    has_many :reviews, dependent: :destroy
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :likers, through: :likes, source: :user

end
