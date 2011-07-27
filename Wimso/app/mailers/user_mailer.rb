class UserMailer < ActionMailer::Base
  
  #config.action_mailer.delivery_method = :smtp 						
								

  
  def welcome(ur)
    user = User.find(ur.user_id)
    mail(:to => user.email,
		:from => "carsten.schipmann@mni.thm.de",
         :subject => "standard-test")
UserMailer.delay(:run_at => 5.seconds.from_now).welcome(ur)
	 
	 
  end
  
  
  
end
