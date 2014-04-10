class Images < ActiveRecord::Base
	belongs_to :story
	
    has_attached_file :img, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    
    validates_attachment_content_type :img, :content_type => ["image/jpg", "image/jpeg", "image/png"]
        
    attr_accessible :img, :story_id
end
