class WelcomeController < ApplicationController
  skip_before_action :authenticate, only: [:index]

  def index
    @current_uri = request.env['PATH_INFO']
    @user = User.find_by(params[:user_id])
  end

end
