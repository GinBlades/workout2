class Exercise < ApplicationRecord
  belongs_to :exercise_set

  validates :name, :duration, presence: true
  validates :duration, :position, :rest, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true }

  def to_s
    name
  end
end
