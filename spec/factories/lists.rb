FactoryGirl.define do
  factory :list do
    name "MyList"
    permissions "open"

    after(:create) do |list|
      create_list(:item, 10, list: list)
    end
  end
end
