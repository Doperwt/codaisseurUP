FactoryBot.define do
  factory :event do
    size              2
    bedroom_count     2
    bathroom_count    3
    name              { Faker::Lorem.words(3).join(' ') }
    description       { Faker::Lorem.sentence(40) }
    location           { Faker::Address.city }
    indcludes_drinks  true
    includes_food     true
    active            true
    price             { Faker::Commerce.price }
    user              { build(:user) }
    starts_at         Faker::Time.between(2.days.from_now, Date.today, :all)
    ends_at           Faker::Time.between(3.days.from_now, Date.today, :all)
    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end
end
