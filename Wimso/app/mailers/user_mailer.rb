class UserMailer < ActionMailer::Base
  
  #config.action_mailer.delivery_method = :smtp 						
  
  def newfriend(user,friend)
	begin

		if( !user or !friend )
			mail(:to => "wimso2011@googlemail.com",
			:from => "jens.mehler@mni.th-mittelhessen.de",
			:subject => "Wimso")	
		else
		@u = user
		@f = friend
			mail(:to => friend.email,
				:from => "jens.mehler@mni.th-mittelhessen.de",
				:subject => "Wimso, Neuer Freund")
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
                                @userrun.iv_change=Time.now
                                @userrun.save
                                if ((@userrun.iv_change + @userrun.interval.days).day == (Time.now+2.days).day && @userrun.interval!=0)
                                    mail(:to => @user.email,
                                        :from => "jens.mehler@mni.thm.de",
                                        :return_path => 'jens.mehler@mni.thm.de',
                                        :subject => "Wimso - Reminder: New Episode") 
                                end
                                       
                                
                        end                
        end
        #UserMailer.delay(:run_at => ur.interval.seconds.from_now).welcome(ur_id)
  end



  
end
