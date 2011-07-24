class GlobalController < ApplicationController
	
	def index
		@allusers=User.all
	end
	
end
