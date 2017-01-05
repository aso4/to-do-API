FactoryGirl.define do
  factory :user do
    username {Faker::Name.first_name}
    password "password"

    after(:create) do |user, evaluator|
      create_list(:list, 1, user: user)
    end
  end
end
