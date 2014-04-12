class Client < ActiveRecord::Base
	belongs_to :artist
	has_many :stories
    attr_accessible :firstname, :lastname
end
