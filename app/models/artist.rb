class Artist < ActiveRecord::Base
	has_many :stories, dependent: :destroy
	has_many :images, dependent: :destroy
	
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/ #["image/jpg", "image/jpeg", "image/png"]
  
  attr_accessible :name, :bio, :avatar
end
