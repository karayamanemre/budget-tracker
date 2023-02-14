require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  describe 'GET #index' do
    before(:each) do
      @user = User.create(name: 'John Doe', email: 'john.doe@example.com', password: 'password')
      @group = Group.new(name: 'Group 1', icon: 'fa fa-users', user: @user)
      @expense = Expense.new(name: 'Rent', amount: 1000, user: @user)
    end
    it 'is an HTTP request' do
      get @expense_path
      expect(response).to have_http_status(200)
    end
    it 'renders the index template' do
      get expenses_path
      expect(response).to render_template(:index)
    end
  end
end
