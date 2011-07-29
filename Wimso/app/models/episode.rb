class Episode < ActiveRecord::Base
  belongs_to :run
	validates :title, :presence => true
end
