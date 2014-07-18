class ArtistController < ApplicationController
    def new
      #Called for creating a new artist.  Used for form.
        @artist = Artist.new
        
        #Ajax call.  Respond in JS.
        respond_to do |format|
            format.js
        end
    end
    
    def create
      #Called after form submission.  Use params to create a new artist.
       @artist = Artist.create(artist_params)

       #Redirect to Dashboard
       redirect_to dashboard_path
    end
    
    def edit
      #Edit the artist.  Get artist information as well as all images by artist.
        @artist = Artist.find(params[:id])
        @images = Image.where(artist_id: @artist)
      
        #Ajax call.  Respond in JS
        respond_to do |format|
            format.js
        end
    end
    
    def update
      #Update the artist with new infomation
        @artist = Artist.find(params[:id])
        
        #If this is a valid artist update...
        #if @artist.update(artist_params)#(params[:artist].permit(:avatar, :name, :bio))
        if @artist.update_attributes(artist_params)

            #Artist info updated.  Now for any new images
            #If [:artist][:img] isn't emtpy
            if(params[:artist]['new_img'] != nil)
                #There is at least 1 new image to be added.  Set count to 0 for accessing current location in params[:artist][:img]
                count = 0
                #Loop through each new image in the params hash
                params[:artist]['new_img'].each do
                    @artist.add_image(params[:artist]['new_img'][count])
                    #Create a new image using params.  This contains the paperclip info such as URL. 
                    #@image = Image.create(img: params[:artist][:img][count])
                    #@image = Image.new()
                    #@image.img = params[:artist]['new_img'][count]
                    #Set the image.artist_id to the current artist for linking
                    #@image.artist_id = @artist.id
                    #Set the image.display = t (true) so that it shows on the homepage.  This can be disable later
                    #@image.display = "t"
                    #Save all the changes to the image
                    #@image.save
                    #Incremint count to get next image (if there is one)
                    count = count + 1
                end
            end
        
            #Check for images to delete in params[:delete_id]
            if(params[:delete_id] != nil)
              #images to delete.  Set count to 0 so we can choose the correct image to delete
              count = 0
              params[:delete_id].each do
                @artist.delete_image(params[:delete_id][count])
                count = count + 1
              end
            end
        
            #Redirect back to Dashboard
            redirect_to dashboard_path
        else
            #There was an error somewhere...
            render 'edit'
        end
    end
    
    def destroy
        #destroy the artist.  also destroys any avatar images
        @artist = Artist.find(params[:id])
        @artist.destroy
      
        #Redirect back to Dashboard
        redirect_to dashboard_path
    end

    def show
      #Shows the artist info page from the Artist link.  Also gets all images the artist has done
        @artist = Artist.find(params[:id])
        @images = Image.where(artist_id: @artist)
    end
    
    private
    def artist_params
      params.require(:artist).permit(:avatar, :name, :bio, images_attributes: [:id, :img, :display, :artist_id])
    end
end