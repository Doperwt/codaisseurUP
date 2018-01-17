FactoryBot.define do
  factory :profile do
    first_name  { Faker::Lorem.words(3).join(' ') }

    last_name  { Faker::Lorem.words(3).join(' ') }
    bio  { Faker::Lorem.words(10).join(' ') }
  end
end
