require 'rails_helper'

RSpec.describe UsersController do
  let(:exam) { create(:exam, :with_time_windows) }

  describe '#create' do
    subject { post :create, params: params }

    context "with invalid exam time window" do
      let(:params) { { first_name: "a", last_name: "b", phone_number: "c", exam_id: exam.id, college_id: 99, start_time: '2020-10-10' } }

      it "should fail" do
        expect { subject }.to raise_error(ActionController::BadRequest)
      end
    end

    context "with valid exam time window", :focus => true do
      let(:params) { { first_name: "a", last_name: "b", phone_number: "c", exam_id: exam.id, college_id: exam.college_id, start_time: DateTime.current.beginning_of_year } }

      it "should update the user" do
        expect(subject).to have_http_status(:ok)
      end
    end
  end
end
