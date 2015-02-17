class Newspost < ActiveRecord::Base
    #Pre strong params
    #attr_accessible :heading, :body, :start_date, :end_date
    
    validates :heading, presence: true
    validates :body, presence: true
end
