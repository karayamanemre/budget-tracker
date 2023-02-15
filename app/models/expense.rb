class Expense < ApplicationRecord
  has_and_belongs_to_many :groups, dependent: :destroy
  belongs_to :user

  attr_accessor :group_id

  validates :name, :amount, presence: true
end
