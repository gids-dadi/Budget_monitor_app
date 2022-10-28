require 'rails_helper'

RSpec.describe 'work', type: :request do
  include Devise::Test::IntegrationHelpers
  before do
    @user = User.create(name: 'Gideon', password: 'password', email: 'gideon@gmail.com')
    @work = @user.groups.create(name: 'laptop', icon: 'icon/laptop')
    sign_in @user
  end

  describe 'GET /index' do
    it 'returns http success' do
      get categories_path
      expect(response).to have_http_status(:success)
    end
  end
end
