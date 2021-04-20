class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :find_user, only: [:show, :after_sign_in_path_for]

    def index
        @users = User.all
        render json: @users
    end

    def show
        @notes = Note.where("user_id" == current_user.id)
        render 'show'
    end

    private

    def find_user
        @user = User.find(params[:id])
    end
end