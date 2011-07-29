class UserController < ApplicationController
	
	before_filter :authenticate_user!
	def show_profile
		@allusers=User.all
	end

	

	def add_friend

		begin
		f = User.find(params[:id])
		(User.find(current_user.id).friends << f )
		UserMailer.delay(:run_at => 2.seconds.from_now).newfriend(current_user,f)
		rescue
		
			redirect_to show_profile_path params[:id]
			
			return
		end
		flash[ :notice] = "adding success"
			redirect_to show_profile_path params[:id]
		
	end

	def del_fr
		puts params[:id]
		f = current_user.friends
		f.each do |a|
			if a.id == params[:id].to_i
				UserMailer.delay(:run_at => 2.seconds.from_now).delfriend(current_user,a)
				f.delete a
			end
		end
		flash[ :notice] = "Friend deleted"
		redirect_to :back
	end
	
	
	def edt_ur

		mr = UserRun.find params[:id].to_i

		if ((params[:sgn].to_i) == 0)
			if mr.curr_eps < mr.run.anz_eps
			mr.curr_eps +=1
			end
		else
			if mr.curr_eps > 0
				mr.curr_eps -=1
			end
		end
		mr.save
		flash[ :notice] = "Update success"
		redirect_to :back
	end

	def add_my
		ur = UserRun.create :user => current_user, :run =>  Run.find(params[:id])
		ur.curr_eps = 0
		ur.interval = 0
		current_user.user_run << ur
		current_user.save
		flash[ :notice] = "Series added"
		redirect_to show_profile_path current_user.id
	end

	def edt_iur
		ur = UserRun.find params[:urun_id]
		ur.interval= params[:interval].to_i
		ur.iv_change = Time.now
		ur.save
		if ur.interval > 0

		UserMailer.delay(:run_at => ur.interval.seconds.from_now).update(ur)
					
		else 

		end
		flash[ :notice] = "Interval changed"	
		redirect_to :back
	end

	def del_ur
		r = UserRun.find params[:id].to_i
		run = Run.find r.run_id
		if !run.global?
			run.destroy
		end
		r.destroy
		flash[ :notice] = "Deletion complete"
		redirect_to show_profile_path current_user.id
	end
	
	
end
