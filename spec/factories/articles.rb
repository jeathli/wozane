FactoryGirl.define do
  factory :article do
    title Faker::Lorem.word
    text  Faker::Lorem.paragraph(2)
    image Faker::Avatar.image("my-own-slug")
  end
end