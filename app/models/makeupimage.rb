class Makeupimage < ActiveRecord::Base
	#This is for all the permanent makeup images.  Each image belongs to 1 makeupartist
	belongs_to :makeartist
	  
	  #Paperclip image.  Saves the image as Medium and Thumb
    has_attached_file :img, :styles => { :medium => "500x500>", :thumb => "100x100>" }, :default_url => "/assets/:style/missing.jpg"

    #Attached file must be an image
    validates_attachment_content_type :img, :content_type => /\Aimage\/.*\Z/
end
