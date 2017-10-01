class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def filter_admin!
  	authenticate_user!
  	redirect_to root_path, alert: "No tienes acceso" unless current_user.admin?
  end

  rescue_from CanCan::AccessDenied do |exception|
  	redirect_to root_url, :alert => exception.message  
  end
end
