require 'rails_helper'

RSpec.describe User do
  let(:user) { build(:user) }

  describe 'Validations' do
    context 'with valid params' do
      it 'is valid' do
        expect(user).to be_valid
      end
    end
  end
end
