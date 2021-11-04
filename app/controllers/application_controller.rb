class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit

  def index
    @images = Image.all
    @users = User.all
  end
end
