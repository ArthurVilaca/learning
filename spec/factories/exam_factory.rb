FactoryBot.define do
  factory :exam do
    name { Faker::Name.unique.name }
    college { create(:college) }

    trait :with_time_windows do
      after(:create) do |exam|
        create_list(:exam_window, 2, exam: exam)
      end
    end
  end
end
