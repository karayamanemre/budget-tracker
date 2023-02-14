require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a name' do
    user = User.new(name: 'John Doe', email: 'john.doe@example.com', password: 'password')
    expect(user).to be_valid
  end

  it 'is invalid without a name' do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'has many groups' do
    user = User.new(name: 'John Doe')
    group1 = user.groups.new(name: 'Group 1')
    group2 = user.groups.new(name: 'Group 2')
    expect(user.groups).to include(group1)
    expect(user.groups).to include(group2)
  end
end
