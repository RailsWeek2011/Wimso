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
		(User.find(params[:id]).friends << User.find(current_user.id))
		rescue
			flash[ :notice] = "already in list"
			redirect_to show_profile_path params[:id]
			
			return
		end
		flash[ :notice] = "adding success"
			redirect_to show_profile_path params[:id]
		
	end
	
	def add_my
		puts params
		ur = UserRun.create :user => current_user, :run =>  Run.find(params[:id])
		ur.curr_eps = 0
		current_user.user_run << ur
		current_user.save
		redirect_to show_profile_path current_user.id
	end
	
	def edt_ur
		puts "!!!!!!!!!!!!!"
		puts params
		mr = UserRun.find params[:id].to_i

		if ((params[:sgn].to_i) == 0)
			mr.curr_eps +=1
		else
			if mr.curr_eps > 0
				mr.curr_eps -=1
			end
		end
		mr.save
		redirect_to :back
	end



	def del_ur
		r = UserRun.find params[:id].to_i
		r.destroy
		redirect_to show_profile_path current_user.id
	end
	
	
end
