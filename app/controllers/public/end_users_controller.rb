class Public::EndUsersController < ApplicationController
    before_action :authenticate_end_user!
    def show
        @user = EndUser.find(params[:id])
    end

    def edit
        @user = EndUser.find(params[:id])
        if @user != current_end_user
            redirect_to public_end_user_path(current_end_user.id)
        end
    end

    def update
        @user = EndUser.find(params[:id])
        if @user.update(end_user_params)
            redirect_to public_end_user_path(current_end_user)
        else
            render :edit
        end
    end

    def taikai
        @user = EndUser.find(params[:id])
    end

    def destroy
        @user = EndUser.find(params[:id])
        @user.update(is_valid: true)
        reset_session
        flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
        redirect_to root_path
    end
    
    private

    def end_user_params
        params.require(:end_user).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:email,:postal_code,:address,:phone_number)
    end

end
