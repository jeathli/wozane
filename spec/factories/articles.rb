FactoryGirl.define do
  factory :article do
    title   Faker::Lorem.sentence(2)
    text    Faker::Lorem.paragraph(2)
    img_url Faker::Company.logo
  end
end
