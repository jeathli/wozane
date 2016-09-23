FactoryGirl.define do
  factory :photo do
    title   Faker::Lorem.sentence(1)
    text    Faker::Lorem.paragraph(2)
    img_url Faker::Company.logo
  end
end
