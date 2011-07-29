class UserMailer < ActionMailer::Base
  
  #config.action_mailer.delivery_method = :smtp 						
  
  def newfriend(user,friend)
	begin

		if( !user or !friend )
			mail(:to => "wimso2011@googlemail.com",
			:from => "wimso2011@googlemail.com",
			:subject => "Wimso")	
		else
		@u = user
		@f = friend
			mail(:to => friend.email,
				:from => "wimso2011@googlemail.com",
				:subject => "Wimso, New Friend")
		end
	rescue		
	#	mail(:to => "garbagegarbage@web.de",
	#			:from => "carsten.schipmann@mni.thm.de",
	#			:subject => "kaputt")
	 end
  end

  def delfriend(user,friend)
	begin

		if( !user or !friend )
			mail(:to => "wimso2011@googlemail.com",
			:from => "wimso2011@googlemail.com",
			:subject => "Wimso")	
		else
		@u = user
		@f = friend
			mail(:to => friend.email,
				:from => "wimso2011@googlemail.com",
				:subject => "Wimso, Friend update")
		end
	rescue		
	#	mail(:to => "garbagegarbage@web.de",
	#			:from => "carsten.schipmann@mni.thm.de",
	#			:subject => "kaputt")
	 end
  end




 def update(ur_id)
        @userrun= UserRun.find(ur_id)
        @user = User.find(@userrun.user_id)
        Run.find(@userrun.run_id)
        
        if(@userrun)
                        if(@user)
												   #v raus für live    v#
                                if ((@userrun.iv_change + @userrun.interval.days).day == (Time.now+@userrun.interval.days).day && @userrun.interval!=0)
		                        @userrun.iv_change=Time.now
		                        @userrun.save
		                            mail(:to => @user.email,
		                                :from => "wimso2011@googlemail.com",
		                                :subject => "Wimso - Reminder: New Episode") 
					#UserMailer.delay(:run_at => ur.interval.seconds.from_now).update(@userrun) #für livebetrieb
                                end
                                       
                                
                        end                
        end
  end



  
end
