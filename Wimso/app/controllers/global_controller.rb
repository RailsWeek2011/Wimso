class GlobalController < ApplicationController
	
	def index
		@allusers=User.all
		@allruns=Run.all
	end
	
end
