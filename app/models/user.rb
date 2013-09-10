class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauth_providers => [:google_oauth2]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :provider, :uid, :avatar
  # attr_accessible :title, :body
  # this will check to see if a user exists based on 
  # the info that comes from google
  # if the user already exits the method should return 
  # the user and the controller then signs the user in 
  def self.from_omniauth(auth)
  	if user = User.find_by_email(auth.info.email)
  		user.provider = auth.provider
  		user.uid = auth.uid
  		user
  	else
  		where(auth.slice(:provider, :uid)).first_orcreate do |user|
  			user.provider = auth.provider
  			user.uid = auth.uid
  			user.username = auth.info.name
  			user.email = auth.info.email
  			user.avatar = auth.info.image
  		end
  	end
  end
end
