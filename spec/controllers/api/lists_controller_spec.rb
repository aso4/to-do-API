require 'rails_helper'

RSpec.describe Api::ListsController, type: :controller do

  let(:my_user) { create(:user) }
  let(:my_list) { my_user.lists.first }

  include AuthHelper
  before(:each) do
    http_login(my_user.username, my_user.password)
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, {user_id: my_user.id, list: {name: 'name', permissions: 'open'}}
      expect(response).to have_http_status(:success)
    end

    it "returns json content type" do
      post :create, {user_id: my_user.id, list: {name: 'name', permissions: 'open'}}
      expect(response.content_type).to eq 'application/json'
    end

    it "creates a list with the correct attributes" do
      post :create, {user_id: my_user.id, list: {name: 'MyString', permissions: 'open'}}
      hashed_json = JSON.parse(response.body)
      expect(my_user.lists.first.name).to eq hashed_json["name"]
    end
  end

  describe "POST #update" do
    it "returns http success" do
      post :update, {user_id: my_user.id, id: my_list.id, list: {name: 'newname'}}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index, {user_id: my_user.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {user_id: my_user.id, id: my_list.id, list: {name: 'newname'}}
      expect(response).to have_http_status(:success)
    end
  end

end
