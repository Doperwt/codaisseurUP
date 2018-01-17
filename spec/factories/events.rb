FactoryBot.define do
  factory :event do
    size              {rand(1..100)}
    name              { Faker::Lorem.words(3).join(' ') }
    description       { Faker::Lorem.sentence(40) }
    location           { Faker::Address.city }
    includes_drinks   {Faker::Boolean.boolean}
    includes_food     {Faker::Boolean.boolean}
    active            {Faker::Boolean.boolean}
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
