class UsersController < ApplicationController
  skip_before_action :authenticate, only: [:index, :new, :create]
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
        redirect_to '/'
    else
        redirect_to '/signup'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :password)
    end
end
