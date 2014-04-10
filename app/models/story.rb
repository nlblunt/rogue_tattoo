class Story < ActiveRecord::Base
			belongs_to :client
			has_many :images
			
    attr_accessible :title, :description, :date, :client_id, :artist_id
end