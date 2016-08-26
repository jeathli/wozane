FactoryGirl.define do
  factory :admin do
    admin_user { Faker::Name.name}
    admin_password "password"
  end
end