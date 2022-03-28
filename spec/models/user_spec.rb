require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(email: 'user@user.com', password: '123456') }

  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to have_db_index(:email).unique }
    it { is_expected.to validate_presence_of(:password) }
  end
end
