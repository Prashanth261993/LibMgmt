class ApplicationController < ActionController::Base

	include Pundit
  	protect_from_forgery

	before_filter :configure_permitted_parameters, if: :devise_controller?

	  def configure_permitted_parameters
	    devise_parameter_sanitizer.for(:account_update) { |u| 
	      u.permit(:password, :password_confirmation, :current_password) 
	    }
	  end

	  def check_if_admin
	  	raise "not authorized" unless UserPolicy.new(@user).is_admin? 
	  end


end
