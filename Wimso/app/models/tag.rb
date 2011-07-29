class Tag < ActiveRecord::Base
  has_and_belongs_to_many :run
  validates :name, :presence => true
end
