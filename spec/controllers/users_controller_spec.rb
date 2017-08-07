require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    let(:new_user_attributes) do
     {
         name: "BlocHead",
         email: "blochead@bloc.io",
         password: "blochead",
         password_confirmation: "blochead"
     }
    end
    
     let(:user) { create(:user) }
     
     context "sign user in" do
         before do 
             sign_in(user)
         end
     
     describe "GET show" do
     it "returns http success" do
       get :show
       expect(response).to have_http_status(:success)
     end
 
     it "instantiates a new user" do
       get :show
       expect(assigns(:user)).to_not be_nil
     end
   end
   end
end
