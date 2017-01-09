require 'rails_helper'

RSpec.describe List, type: :model do
  let(:user) { create(:user) }
  let(:list) { user.lists.first }
  let(:item) { list.items.first }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_least(1) }
  it { is_expected.to validate_presence_of(:permissions) }

  describe "attributes" do
    it "has a name and user attribute" do
      expect(list).to have_attributes(name: list.name, user: user)
    end

    it "factory permissions is set to open" do
      expect(list).to have_attributes(permissions: "open")
    end
  end

end
