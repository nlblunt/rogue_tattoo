class ArtistController < ApplicationController
    def new
        @artist = Artist.new
        
        respond_to do |format|
            format.js
        end
    end
    
    def create
       @artist = Artist.new(params[:artist])
       @artist.save


       redirect_to dashboard_path
    end
    
    def edit
        @artist = Artist.find(params[:id])
        @images = Image.where(artist_id: @artist)
      
        respond_to do |format|
            format.js
        end
    end
    
    def update
        @artist = Artist.find(params[:i])
        
        if @artist.update(params[:artist].permit(:avatar, :name, :bio))
            
            if(params[:artist][:img] != nil)
                count = 0
                params[:artist][:img].each do 
                    @image = Image.create(params[:artist][:img][count])
                    @image.artist_id = @artist.id
                    @image.display = "t"
                    @image.save
                    
                    #@image = @story.images.create(img: params[:artist][:img][count])
                    #@image.artist_id = params[:artist][:artist_id]
                    #@image.display = "t"
                    #@image.save
                    
                    count = count + 1
                end
            end
        
            redirect_to dashboard_path
        else
            render 'edit'
        end
    end
    
    def destroy
        #destroy the artist.  also destroys any avatar images
      @artist = Artist.find(params[:id])
      
      if((@artist.name != 'Josh') or (@artist.name != 'Josh Ludlow'))
        @artist.destroy
      end
      
      
      redirect_to dashboard_path
    end

    def show
        @artist = Artist.find(params[:id])
        @images = Image.where(artist_id: @artist)
    end
    
    def artist_params
      params.require(:artist).permit(:avatar, :name, :bio)
    end
end