require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'John Doe', email: 'john.doe@example.com', password: 'password') }
  let(:group) { Group.new(name: 'Group 1', icon: 'fa fa-users', user: user) }

  context 'validations' do
    it 'is valid with a name, icon, and user' do
      expect(group).to be_valid
    end

    it 'is invalid without a name' do
      group.name = nil
      expect(group).not_to be_valid
    end

    it 'is invalid without an icon' do
      group.icon = nil
      expect(group).not_to be_valid
    end

    it 'is invalid without a user' do
      group.user = nil
      expect(group).not_to be_valid
    end
  end

  context 'associations' do
    it 'belongs to a user' do
      expect(group.user).to eq(user)
    end

    it 'has and belongs to many expenses' do
      expense1 = Expense.create(name: 'Expense 1', amount: 100, user: user)
      expense2 = Expense.create(name: 'Expense 2', amount: 200, user: user)
      group.expenses << expense1
      group.expenses << expense2
      expect(group.expenses).to include(expense1, expense2)
    end
  end

  context 'attributes' do
    it 'has a name' do
      expect(group.name).to eq('Group 1')
    end

    it 'has an icon' do
      expect(group.icon).to eq('fa fa-users')
    end
  end
end
