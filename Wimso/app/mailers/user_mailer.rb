class UserMailer < ActionMailer::Base
  
  #config.action_mailer.delivery_method = :smtp 						
								

  
  def welcome(ur)
	  begin
		@user = User.find(ur.user_id)
		@userrun= ur
		Run.find(@userrun.run_id)
		
		if(ur.is_nil? || @user.is_nil? )
			mail(:to => "garbagegarbage@web.de",
			:from => "carsten.schipmann@mni.thm.de",
			:subject => "kaputt-test")	
		else
			#TODO last modified
			mail(:to => @user.email,
				:from => "carsten.schipmann@mni.thm.de",
				:subject => "Wimso, Dein SerienUpdate")
			#UserMailer.delay(:run_at => 5.seconds.from_now).welcome(ur)
		end
	rescue		
		mail(:to => "garbagegarbage@web.de",
				:from => "carsten.schipmann@mni.thm.de",
				:subject => "kaputt")
	 end
  end
  
  
  
end
