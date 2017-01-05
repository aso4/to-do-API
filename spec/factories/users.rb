FactoryGirl.define do
  factory :user do
    username "MyString"
    password "MyString"

    after(:create) do |user, evaluator|
      create_list(:list, 1, user: user)
    end
  end
end
