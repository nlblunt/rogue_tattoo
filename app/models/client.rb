class Client < ActiveRecord::Base
	belongs_to :artist
	has_many :stories, dependent: :destroy
    attr_accessible :firstname, :lastname
end
