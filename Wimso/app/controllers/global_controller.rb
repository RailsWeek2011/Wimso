class GlobalController < ApplicationController
	
	def index
		@allusers=User.all
		@allruns=Run.all
	end
	
	def search
		puts "\n\n\n\n\n\n\n\n\n\n"
		puts params
		begin
			allsstring=params[:q].split(" ")
		rescue
			allsstring = []
		end
		@allusers= []
		User.all.each do |usr|
			allsstring.each do |sstring|
				sstring=sstring.downcase
				if usr.name.downcase.include? sstring
					@allusers << usr
					break
				end
			end
		end
	
		@allruns=[]
		Run.all.each do |ru|
			allsstring.each do |sstring|
				sstring=sstring.downcase
				if ru.name.downcase.include? sstring
					@allruns << ru
					break;
				end
				ru.tag.each do |tg|
					if tg.name.downcase.include? sstring
						@allruns << ru
						break;
					end
				
				end
				ru.episodes.each do |ep|
					if ep.title.downcase.include? sstring
							@allruns << ru
							break;
					end			
				end
				
				
			end
			
		end
		@allruns= @allruns.uniq
		@allruns= @allruns.sort {|x,y| x.name <=> y.name } 
		@allusers= @allusers.sort {|x,y| x.name <=> y.name } 
		#@runs= Run.where("name LIKE '%#{params[:searchstring]}%'")
		
		#puts @allusers[0].name
		#puts "\n\n\n\\n\n"
	end
	
	
end
