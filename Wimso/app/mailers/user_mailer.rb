class UserMailer < ActionMailer::Base
  
  #config.action_mailer.delivery_method = :smtp 						
								

  
  def update(ur)
	  begin
		@user = User.find(ur.user_id)
		@userrun= ur
		Run.find(@userrun.run_id)
		
		if(ur.is_nil? || @user.is_nil? )
			mail(:to => "garbagegarbage@web.de",
			:from => "carsten.schipmann@mni.thm.de",
			:subject => "kaputt-test")	
		else
			if ur.iv_change + u.interval.days >= Time.now
			ur.iv_change = Time.now
			ur.save			
			mail(:to => @user.email,
				:from => "carsten.schipmann@mni.thm.de",
				:subject => "Wimso, New Episode Update")
			UserMailer.delay(:run_at => ur.interval.seconds.from_now).welcome(ur)
			end
		end
	rescue		
	#	mail(:to => "garbagegarbage@web.de",
	#			:from => "carsten.schipmann@mni.thm.de",
	#			:subject => "kaputt")
	 end
  end
  
  def newfriend(user,friend)
	begin

		if(user.is_nil? || friend.is_nil? )
			mail(:to => "garbagegarbage@web.de",
			:from => "carsten.schipmann@mni.thm.de",
			:subject => "kaputt-test")	
		else
		@u = user
		@f = friend
			mail(:to => friend.email,
				:from => "carsten.schipmann@mni.thm.de",
				:subject => "Wimso, Neuer Freund")
		end
	rescue		
	#	mail(:to => "garbagegarbage@web.de",
	#			:from => "carsten.schipmann@mni.thm.de",
	#			:subject => "kaputt")
	 end
  end
  
end
