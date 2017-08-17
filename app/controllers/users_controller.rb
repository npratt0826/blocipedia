class UsersController < ApplicationController
    def index
        @users = User.all
    end
    
    def show
        @user = User.find(params[:id])
        @wiki = @user.wikis.all
    end
    
    def new 
    end
end
