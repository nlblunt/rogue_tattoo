class Newspost < ActiveRecord::Base
    attr_accessible :heading, :body, :start, :end
end
