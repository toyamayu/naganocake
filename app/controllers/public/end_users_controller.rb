class Public::EndUsersController < ApplicationController
    def show
        @user = EndUser.find(params[:id])
    end

    protected
    

end
