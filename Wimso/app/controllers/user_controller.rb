class UserController < ApplicationController
	
	before_filter :authenticate_user!, :except => [:index]
	def index
		@allusers=User.all
	end
	def show_profile
		@allusers=User.all
	end
	
	def add_friend
		puts "----------------------------"
		puts params[:id]
		User.find(current_user.id).friends << User.find(params[:id])
		redirect_to show_profile_path
		
	end
	
	
end
