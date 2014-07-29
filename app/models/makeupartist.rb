class Makeupartist < ActiveRecord::Base
	# Must have a name
	validates :name, presence: true

	# Has many makeup images
	has_many :makeupimages, dependent: :destroy

	# Use for updating images
	accepts_nested_attributes_for :makeupimages

	# Paperclip avatar
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/:style/missing.jpg"

	#Make sure the attached file is an image
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

     def add_makeupimage(img)
    	image = self.makeupimages.new()
    	image.img = img
    	image.save
    end

    def delete_makeupimage(id)
    	self.makeupimages.destroy(id)
    end
end
