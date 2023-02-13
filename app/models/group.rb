class Group < ApplicationRecord
  has_and_belongs_to_many :expenses
  belongs_to :user

  validates :name, :icon, presence: true
end
