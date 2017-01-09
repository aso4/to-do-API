require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user) { create(:user) }
  let(:list) { user.lists.first }
  let(:item) { list.items.first }

  it { is_expected.to belong_to(:list) }

  it { is_expected.to validate_presence_of(:desc) }
  it { is_expected.to validate_length_of(:desc).is_at_least(1) }

  it "has a description and completed attribute" do
    expect(item).to have_attributes(desc: item.desc, completed: item.completed)
  end
end
