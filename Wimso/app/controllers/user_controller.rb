class UserController < ApplicationController
	
	before_filter :authenticate_user!
	def show_profile
		@allusers=User.all
	end
	def add_friend
		puts "----------------------------"
		puts params[:id]
		begin
		(User.find(current_user.id).friends << User.find(params[:id]))
		
		rescue
			flash[ :notice] = "already in list"
			redirect_to show_profile_path params[:id]
			
			return
		end
		flash[ :notice] = "adding success"
			redirect_to show_profile_path params[:id]
		
	end
	
	
end
