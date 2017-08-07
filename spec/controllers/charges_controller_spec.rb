require 'rails_helper'
require "stripe"

RSpec.describe ChargesController, type: :controller do
  let(:user) { create(:user) }
  
  before do 
    sign_in(user)
  end
  
  describe "GET create" do
    before do 
      sign_in(user)
    end
    
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end
