require 'rails_helper'

RSpec.describe List, type: :model do
  let(:user) { User.create!(name: "Test User", email: "user@example.com", password: "123456") }
  let(:list) { user.lists.create!(name: name, user: user) }
  let(:name) { 'test list' }

    it { is_expected.to belong_to(:user) }

    it { is_expected.to validate_presence_of(:user) }

    it "has a name and user attribute" do
      expect(list).to have_attributes(name: name, user: user)
    end
end
