class User < ApplicationRecord
  has_many :exercise_sets, dependent: :destroy

  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def to_s
    email
  end
end
