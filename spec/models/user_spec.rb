require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(name: "Test User", email: "user@example.com", password: "123456") }

  it { is_expected.to have_many(:lists) }

  # Shoulda tests for name
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_least(1) }
end
