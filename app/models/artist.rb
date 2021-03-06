class Artist < ActiveRecord::Base
	#No longer has stories.  Keeping incase this feature gets added again
	#has_many :stories, dependent: :destroy
	
	#Make sure name and bio are filled out.
	validates :name, presence: true #:bio, presence: true
	
		#Each artist has many images.  Also, if the artist is destroyed, destory all images by that artist
	has_many :images, dependent: :destroy
	
	#Used to add images while updating the artist info
	accepts_nested_attributes_for :images
	
	  #Paperclip attached file.  This is for the artist Avatar pic.  Saves as both Medium and Thumb
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/:style/missing.jpg"
    #Make sure the attached file is an image
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/ #["image/jpg", "image/jpeg", "image/png"]
  
    def add_image(img)
    	image = self.images.new()
    	image.img = img
    	image.display = "t"
    	image.save
    end

    def delete_image(id)
    	self.images.destroy(id)
    end

    def self.list
    	return Artist.all
    end
end
