class UserController < ApplicationController
	
	before_filter :authenticate_user!, :except => [:index]
	def index
		@allusers=User.all
	end
	def show_profile
		@allusers=User.all
		puts "arsch"
	end
	
	
end
