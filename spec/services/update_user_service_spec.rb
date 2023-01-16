require 'rails_helper'

RSpec.describe UpdateUserService do
  let(:user) { build(:user) }
  let(:service) { described_class.new(user, params) }
  
  describe '#update_user' do
    context "college_id is invalid" do
      let(:params) { { first_name: "a", last_name: "b", phone_number: "c", college_id: 99 } }

      it "should fail" do
        expect { service.update_user }.to raise_error(ActionController::BadRequest)
      end
    end

    context "college_id is valid" do
      let(:params) { { first_name: "a", last_name: "b", phone_number: "c", college_id: 1 } }

      it "should update the user" do
        service.update_user
        expect(user.reload.first_name).to eq("a")
      end
    end
  end
end
