class ExerciseSet < ApplicationRecord
  belongs_to :user
  has_many :exercises, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :user_id }
end
