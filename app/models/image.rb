class Image < ActiveRecord::Base
  #This is for all the tattoo images.  Each image belongs to 1 artist
	belongs_to :artist
	  
	  #Paperclip image.  Saves the image as Medium and Thumb
    has_attached_file :img, :styles => { :medium => "500x500>", :thumb => "100x100>" }, :default_url => "/assets/:style/missing.jpg"

    #Attached file must be an image
    validates_attachment_content_type :img, :content_type => /\Aimage\/.*\Z/ #["image/jpg", "image/jpeg", "image/png"]
    
    #Pre strong params.   
    #attr_accessible :img, :story_id, :artist_id
end
