class OmniauthCallbacksController < ApplicationController
	 def google_oauth2
	  	user = User.from_omniauth(request.env["omniauth.auth"])
	  	if user.persisted?
	  		flash.notice = "You're signed in with Google."
	  		sign_in_and_redirect user
	  	else
	  		session["devise.user_attributes"] = user.attributes
	  		flash.notice = "You are almost Done! Please create a password."
	  		redirect_to new_user_registration_url
	  	end
  end
end
