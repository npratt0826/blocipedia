require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  
  it { is_expected.to have_many(:wikis) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }
end

  describe "attributes" do
    it "should have name and email attributes" do
      expect(user).to have_attributes(email: user.email)
    end
    it "responds to role" do
       expect(user).to respond_to(:role)
     end
 
     it "responds to admin?" do
       expect(user).to respond_to(:admin?)
     end
 
     it "responds to member?" do
       expect(user).to respond_to(:standard?)
     end
     
     it "responds to member?" do
       expect(user).to respond_to(:premium?)
     end
   end
