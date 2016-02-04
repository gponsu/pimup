class User < ApplicationRecord
  has_one :team
  accepts_nested_attributes_for :team

  validates :email, presence: true, uniqueness: true
end
