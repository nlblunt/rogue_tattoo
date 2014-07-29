class MakeupartistController < ApplicationController
	def new
		#Called for creating a new makeup artist
		@m_artist = Makeupartist.new

		#Ajax call.  Respond in JS.
		respond_to do |format|
			format.js
		end
	end

	def create
		#Called after form submission
		@m_artist = Makeupartist.create(makeupartist_params)

		#Redirect to Dashboard
		redirect_to dashboard_path
	end

	 def edit
      #Edit the artist.  Get artist information as well as all images by artist.
        @m_artist = Makeupartist.find(params[:id])
        @images = Makeupimage.where(makeupartist_id: @m_artist)
      
        #Ajax call.  Respond in JS
        respond_to do |format|
            format.js
        end
    end
    
    def update
      #Update the artist with new infomation
        @m_artist = Makeupartist.find(params[:id])
        
        #If this is a valid artist update...
        #if @artist.update(artist_params)#(params[:artist].permit(:avatar, :name, :bio))
        if @m_artist.update_attributes(makeupartist_params)

            #Artist info updated.  Now for any new images
            #If [:artist][:img] isn't emtpy
            if(params[:makeupartist]['new_img'] != nil)
                #There is at least 1 new image to be added.  Set count to 0 for accessing current location in params[:artist][:img]
                count = 0
                #Loop through each new image in the params hash
                params[:makeupartist]['new_img'].each do
                    @m_artist.add_makeupimage(params[:makeupartist]['new_img'][count])
                    count = count + 1
                end
            end
        
            #Check for images to delete in params[:delete_id]
            if(params[:delete_id] != nil)
              #images to delete.  Set count to 0 so we can choose the correct image to delete
              count = 0
              params[:delete_id].each do
                @m_artist.delete_makeupimage(params[:delete_id][count])
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
        @m_artist = Makeupartist.find(params[:id])
        @m_artist.destroy
      
        #Redirect back to Dashboard
        redirect_to dashboard_path
    end

    def show
      #Shows the artist info page from the Artist link.  Also gets all images the artist has done
        @m_artist = Makeupartist.find(params[:id])
        @images = Makeupimage.where(makeupartist_id: @m_artist)
    end
    
    private
    def makeupartist_params
      params.require(:makeupartist).permit(:avatar, :name, :bio, makeupimages_attributes: [:id, :img, :display, :makeupartist_id])
    end
end
