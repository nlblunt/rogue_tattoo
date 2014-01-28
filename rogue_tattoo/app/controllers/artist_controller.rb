class ArtistController < ApplicationController
    def new
        @artist = Artist.new
    end
    
    def create
       #@artist = Artist.create(artist_params)
       @artist = Artist.new(params[:artist])
       @artist.save
       logger.debug @artist.inspect

       redirect_to dashboard_path
    end
    
    def edit
    end
    
    def destroy
      @artist.destroy
    end

    def artist_params
      params.require(:artist).permit(:avatar, :name, :bio)
    end
end
