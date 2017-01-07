require 'rails_helper'

RSpec.describe Api::ItemsController, type: :controller do

  let(:my_user) { create(:user) }
  let(:my_list) { my_user.lists.first }

  include AuthHelper
  before(:each) do
    http_login(my_user.username, my_user.password)
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, { list_id: my_list.id, desc: 'description', completed: false}
      expect(response).to have_http_status(:success)
    end

    it "returns json content type" do
      post :create, { list_id: my_list.id, desc: 'description', completed: false}
      expect(response.content_type).to eq 'application/json'
    end

    it "creates an item with the correct attributes" do
      post :create, { list_id: my_list.id, desc: 'description', completed: false}
      hashed_json = JSON.parse(response.body)
      expect(my_list.items.first.desc).to eq hashed_json["desc"]
    end
  end

  describe "POST #update" do
    it "returns http success" do
      post :create, { list_id: my_list.id, desc: 'description', completed: false}
      post :update, { id: my_list.items.first, desc: 'newdescription', completed: false}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index, { list_id: my_list.id}
      expect(response).to have_http_status(:success)
    end
  end

end
