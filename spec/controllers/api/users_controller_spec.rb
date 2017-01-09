require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do

  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:user3) { create(:user) }

  include AuthHelper
  before(:each) do
    http_login(user1.username, user1.password)
    user2
    user3
  end

  describe "POST #create" do
    it "creates a new user after authenticating a user" do
      params = { 'user' => { 'username' => 'testuser', 'password' => 'password' } }
      expect{ post :create, params }.to change{ User.count }.by 1
    end
    it "returns the new user's data in JSON format" do
      params = { 'user' => { 'username' => 'testuser', 'password' => 'password' } }
      post :create, params
      json_data = { 'id' => 4, 'email' => nil, 'username' => 'testuser' }
      expect(JSON.parse(response.body)).to eq(json_data)
    end
  end

  describe "GET #index" do
    it "returns only the user's information" do
      get :index
      json_data = [{"id"=>1, "email"=>nil, "username"=> user1.username }, {"id"=>2, "email"=>nil, "username"=> user2.username }, {"id"=>3, "email"=>nil, "username"=> user3.username}]
      expect(JSON.parse(response.body)).to eq(json_data)
    end
  end
end
