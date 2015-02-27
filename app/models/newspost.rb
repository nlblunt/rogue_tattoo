class Newspost < ActiveRecord::Base
    #Pre strong params
    #attr_accessible :heading, :body, :start_date, :end_date
    
    validates :heading, presence: true
    validates :body, presence: true

    def self.show_news
    	return Newspost.where("DATE(?) BETWEEN start_date AND end_date", Date.today)
    end
end
