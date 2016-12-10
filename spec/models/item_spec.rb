require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user) { User.create!(name: "Test User", email: "user@example.com", password: "123456") }
  let(:list) { user.lists.create!(name: name, user: user) }
  let(:name) { 'test list' }
  let(:desc) { 'description'}
  let(:item) { Item.create!(desc: desc, list: list, user: user)}

    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:list) }

    it { is_expected.to validate_presence_of(:list) }
    it { is_expected.to validate_presence_of(:desc) }
    it { is_expected.to validate_length_of(:desc).is_at_least(1) }

    it "has a desc, list, and user attribute" do
      expect(item).to have_attributes(desc: desc, list: list, user: user)
    end
end
