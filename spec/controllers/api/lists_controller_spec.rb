require 'rails_helper'

RSpec.describe Api::ListsController, type: :controller do

  let(:my_user) { create(:user) }
  let(:my_list) { my_user.lists.first }

  include AuthHelper
  before(:each) do
    http_login(my_user.username, my_user.password)
  end

  describe "POST #update" do
    it "returns http success" do
      post :update, {user_id: my_user.id, id: my_list.id, list: {name: 'newname'}}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end
