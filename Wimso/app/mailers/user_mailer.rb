class UserMailer < ActionMailer::Base
  
  #config.action_mailer.delivery_method = :smtp 						
								
  def welcome_email(user)
    @user = user    
    mail(:to => user.email,
		:from => "carsten.schipmann@mni.thm.de",
         :subject => "Welcome to My Awesome Site",
	 :content => "Hallo")
  end
  
  def welcome(user)
    @user = user    
    mail(:to => user.email,
		:from => "carsten.schipmann@mni.thm.de",
         :subject => "standard-test",
	 :content => "Hallo")
  end
  
  
  
end
