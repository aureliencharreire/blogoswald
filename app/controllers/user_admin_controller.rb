class UserAdminController < ApplicationController
    before_action :set_user, only: [:show, :edit, :destroy]
    before_action :authenticate_user!
    before_action :UserAccept, only: [:edit,:update, :destroy]

    def index
        @users = User.all
    end

    def edit
        @user = User.find_by_id(params[:id])
    end

    def update
        @user = User.find_by_id(params[:id])
        respond_to do |format|
            if @user.update(account_update_params)
                format.html { redirect_to user_admin_index_path, notice: 'User was successfully updated.' }
                format.json { render :show, status: :ok, location: @user }
            else
                format.html { render :edit }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
      @user.destroy
      respond_to do |format|
        format.html { redirect_to user_admin_index_path, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    protected

    def set_user
      @user = User.find(params[:id])
    end

    def UserAccept
        if !params[:id].present?
            redirect_to root_path
        else
            redirect_to root_path unless current_user.admin == true
        end
    end

    def account_update_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password, :admin)
    end

end
