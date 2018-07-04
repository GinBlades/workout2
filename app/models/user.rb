class User < ApplicationRecord
  has_many :exericse_sets, dependent: :destroy

  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
