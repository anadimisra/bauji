class CallbacksController < Devise::OmniauthCallbacksController

	def google_oauth2
	    @user = User.find_for_omniauth(request.env["omniauth.auth"])
	    sign_in_and_redirect @user
	end
	
end