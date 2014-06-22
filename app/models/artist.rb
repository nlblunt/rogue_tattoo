class Artist < ActiveRecord::Base
	has_many :stories, dependent: :destroy
	has_many :images, dependent: :destroy
	
	accepts_nested_attributes_for :images
	
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => 'https://s3-us-west-2.amazonaws.com/rogue-tattoo/common/missing_:style.jpg' #"/images/:style/missing.jpg"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/ #["image/jpg", "image/jpeg", "image/png"]
  
  attr_accessible :name, :bio, :avatar
end
