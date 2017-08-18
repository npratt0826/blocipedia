require 'rails_helper'
include RandomData


RSpec.describe WikisController, type: :controller do
  let(:my_user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:my_wiki) { create(:wiki, user: my_user, private: false) }
  before do
      sign_in my_user
    end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "assigns [my_wiki] to @wikis" do
      get :index
      expect(assigns(:wikis)).to eq([my_wiki])
    end
  end

  describe "GET show" do
    # before do
    #   @request.env['devise.mapping'] = Devise.mappings[:wikis]
    # end
    
     it "returns http success" do
       get :show, params: { id: my_wiki.id }
       expect(response).to have_http_status(:success)
     end
     it "renders the #show view" do
       get :show, params: { id: my_wiki.id }
       expect(response).to render_template :show
     end
 
     it "assigns my_wiki to @wiki" do
       get :show, params: { id: my_wiki.id }
       expect(assigns(:wiki)).to eq(my_wiki)
     end
   end

  describe "GET new" do
    
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end
    
    it "instantiates @wiki" do
      get :new
      expect(assigns(:wiki)).not_to be_nil
    end
  end
  
  describe "WIKI create" do
    
    it "increases the number of wikis by 1" do
      expect{ wiki :create, params: { user_id: my_wiki.id, wiki: { title: RandomData.random_sentence, body: RandomData.random_paragraph } } }.to change(Wiki,:count).by(1)
    end
    
    it "assigns new wiki to @wiki" do
      expect(assigns(:my_wiki)).to eq Wiki.last
    end
    
    it "redirects to new wiki" do
      wiki :create, params: { wiki: { title: RandomData.random_sentence, body: RandomData.random_paragraph }}
      expect(response).to redirect_to Wiki.last
    end
  end
  

  describe "GET edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end
  
  context "private wikis" do
    describe "admin and premium users have access to private wikis" do
      it "makes public wiki private" do
        
      end
    end
  end

end
