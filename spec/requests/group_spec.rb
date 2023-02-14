require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  describe 'GET #index' do
    before(:each) do
      @user = User.create(name: 'John Doe', email: 'john.doe@example.com', password: 'password')
      post user_session_path, params: { user: { email: @user.email, password: @user.password } }
    end

    it 'is an HTTP request' do
      get groups_path
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get groups_path
      expect(response).to render_template(:index)
    end

    it 'displays the group name on the page' do
      group = Group.create(name: 'Group 1', icon: 'https://png.pngtree.com/element_our/png/20180930/food-icon-design-vector-png_120564.jpg', user: @user)
      get groups_path
      expect(response.body).to include('Group 1')
    end
  end
end
