class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  	before_action :authenticate_user!
  	def home
  		render template: "pages/#{params[:page]}"
  	end
end
