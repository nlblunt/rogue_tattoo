class ArtistController < ApplicationController
    def new
        @artist = Artist.new
    end
    
    def create
       @artist = Artist.create(artist_params) 
       
       redirect_to dashboard_path
    end
    
    def edit
    end
    
    
    def artist_params
      params.require(:artist).permit(:avatar, :name, :bio)
    end
end
