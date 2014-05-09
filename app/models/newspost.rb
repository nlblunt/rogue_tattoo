class Newspost < ActiveRecord::Base
    attr_accessible :heading, :body, :start_date, :end_date
end
