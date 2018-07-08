class User < ApplicationRecord
  has_many :exercise_sets, dependent: :destroy

  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def to_s
    email
  end

  def self.approved_users
    File.readlines(Rails.root.join("data", "approved_users.txt")).map(&:strip)
  end
end
