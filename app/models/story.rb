class Story < ActiveRecord::Base
    attr_accessible :title, :description, :date, :client_id, :artist_id
end
