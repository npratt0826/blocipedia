require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  
  it { is.expected.to have_many(:wikis) }
  it { is.expected.to validate_presence_of(:email) }
  it { is.expected.to validate_presence_of(:password) }
end
