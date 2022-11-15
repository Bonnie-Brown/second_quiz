class Like < ApplicationRecord

  # Associations
  belongs_to :user
  belongs_to :idea

  # Validations

  validates(
    :idea_id,
    uniqueness: {
      scope: :user_id,
      message: "Has already been liked."
    }
  )
  
end
