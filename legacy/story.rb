#Legacy class.  Saving incase adding back in
class Story < ActiveRecord::Base
			belongs_to :client
			has_many :images, dependent: :destroy
			
			accepts_nested_attributes_for :images
    #attr_accessible :title, :description, :date, :client_id, :artist_id, :featured
end