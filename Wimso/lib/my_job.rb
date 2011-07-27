module MyJob#http://railscasts.com/episodes/171-delayed-job
	
class MailorJob < Struct.new(:ur_id,:id)		
		
		def perform
			u= User.first
			u.name= "Horst"
			u.save
			puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>enqueue"
			UserMailer.welcome(User.find(User.first.id)).deliver
		end
		  def enqueue(job)
			  puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>enqueue"
		#    record_stat 'mailor_job/enqueue'
		  end


		  def before(job)
			  puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>before"
		#    record_stat 'mailor_job/start'
		  end

		  def after(job)
			  puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>after"
		#    record_stat 'mailor_job/after'
		  end

		  def success(job)
			  puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>success"
		#    record_stat 'mailor_job/success'
		  end

		  def error(job, exception)
			puts  ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>error"  
		    #notify_hoptoad(exception)
		  end

		  def failure
			    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>fail"
		    #page_sysadmin_in_the_middle_of_the_night
		  end
	end
	
	
end