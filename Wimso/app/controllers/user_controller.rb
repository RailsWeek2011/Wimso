class UserController < ApplicationController
	
	before_filter :authenticate_user!
	def show_profile
		@allusers=User.all
	end

	

	def add_friend

		begin
		f = User.find(params[:id])
		(User.find(current_user.id).friends << f )
		UserMailer.newfriend(current_user,f).deliver
		rescue
			flash[ :notice] = "already in list"
			redirect_to show_profile_path params[:id]
			
			return
		end
		flash[ :notice] = "adding success"
			redirect_to show_profile_path params[:id]
		
	end
	
	
	def edt_ur

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

	def edt_iur
		ur = UserRun.find params[:urun_id]
		ur.interval= params[:interval].to_i
		ur.iv_change = Time.now
		ur.save
		UserMailer.delay(:run_at => ur.interval.seconds.from_now).update(ur)
							#UserMailer.delay(:run_at => 5.seconds.from_now).
			#welcome(User.find(User.first.id))
					
					
		redirect_to :back
	end

	def del_ur
		r = UserRun.find params[:id].to_i
		r.destroy
		redirect_to show_profile_path current_user.id
	end
	
	
end
