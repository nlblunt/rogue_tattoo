class Images < ActiveRecord::Base
    has_attached_file :img, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    attr_accessible :img
end
