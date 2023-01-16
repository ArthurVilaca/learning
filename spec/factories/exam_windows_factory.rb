FactoryBot.define do
  factory :exam_window do
    start_time { DateTime.current.beginning_of_year }
    end_time { DateTime.current.end_of_year }
    exam { create(:exam) }
  end
end
