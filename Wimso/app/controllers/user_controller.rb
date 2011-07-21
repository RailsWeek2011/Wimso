class UserController < ApplicationController
	
	
	def index
		@allusers=User.all	
	end
	
end
