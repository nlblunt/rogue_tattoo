class Story < ActiveRecord::Base
			belongs_to :client
			has_many :images
			
			accepts_nested_attributes_for :images
    attr_accessible :title, :description, :date, :client_id, :artist_id, :featured
end