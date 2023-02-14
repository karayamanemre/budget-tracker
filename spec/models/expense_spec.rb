require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) { User.create(name: 'John Doe', email: 'john.doe@example.com', password: 'password') }
  let(:expense) { Expense.new(name: 'Rent', amount: 1000, user: user) }

  context 'validations' do
    it 'is valid with a name, amount, and user' do
      expect(expense).to be_valid
    end

    it 'is invalid without a name' do
      expense.name = nil
      expect(expense).not_to be_valid
    end

    it 'is invalid without an amount' do
      expense.amount = nil
      expect(expense).not_to be_valid
    end

    it 'is invalid without a user' do
      expense.user = nil
      expect(expense).not_to be_valid
    end
  end

  context 'associations' do
    it 'belongs to a user' do
      expect(expense.user).to eq(user)
    end

    it 'has and belongs to many groups' do
      group1 = Group.create(name: 'Group 1', user: user)
      group2 = Group.create(name: 'Group 2', user: user)
      expense.groups << group1
      expense.groups << group2
      expect(expense.groups).to include(group1, group2)
    end
  end

  context 'attributes' do
    it 'has a name' do
      expect(expense.name).to eq('Rent')
    end

    it 'has an amount' do
      expect(expense.amount).to eq(1000)
    end
  end
end
