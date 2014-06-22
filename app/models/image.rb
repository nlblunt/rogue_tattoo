class Image < ActiveRecord::Base
	belongs_to :story
	belongs_to :artist
	
    has_attached_file :img, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => 'https://s3-us-west-2.amazonaws.com/rogue-tattoo/common/missing_:style.jpg' 


    validates_attachment_content_type :img, :content_type => /\Aimage\/.*\Z/ #["image/jpg", "image/jpeg", "image/png"]
    #do_not_validate_attachment_file_type :img    
    attr_accessible :img, :story_id, :artist_id
end
