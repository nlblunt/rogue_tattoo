class ArtistController < ApplicationController
    def new
        @artist = Artist.new
    end
    
    def create
       @artist = Artist.new(params[:artist])
       @artist.save


       redirect_to dashboard_path
    end
    
    def edit
        @artist = Artist.find(params[:id])
    end
    
    def update
        @artist = Artist.find(params[:id])
        
        if @artist.update(params[:artist].permit(:avatar, :name, :bio))
            redirect_to dashboard_path
        else
            render 'edit'
        end
    end
    
    def destroy
        #destroy the artist.  also destroys any avatar images
      @artist = Artist.find(params[:id])
      @artist.destroy
      
      
      redirect_to dashboard_path
    end

    def artist_params
      params.require(:artist).permit(:avatar, :name, :bio)
    end
end
