class Team < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
end
