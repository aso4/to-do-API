require 'rails_helper'

RSpec.describe Api::ItemsController, type: :controller do

  let(:my_user) { create(:user) }
  let(:my_list) { my_user.lists.first }
  #let(:item1) { create(:item, :list => my_user.lists.first ) }#{ create(:item) }

  include AuthHelper
  before(:each) do
    http_login(my_user.username, my_user.password)
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, { list_id: my_list.id, desc: 'description', completed: false}
      puts(response)
      expect(response).to have_http_status(:success)
    end
  end

end
