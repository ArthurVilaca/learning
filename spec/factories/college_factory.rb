FactoryBot.define do
  factory :college do
    name { Faker::Name.unique.name }
  end
end
