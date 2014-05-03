class StoryController < ApplicationController
  def new
      @story = Story.new
      @client = Client.find(params[:c_id])
      @artists = Artist.all
      @image = Image.new
  end

  def create
      @story = Story.new(params[:story])
      @story.save
      
      @artists = Artist.all
      
      if(params[:story][:img] != nil)
         count = 0
         params[:story][:img].each do 
         @image = @story.images.create(img: params[:story][:img][count])
         @image.artist_id = params[:story][:artist_id]
         logger.debug @image.artist_id
         @image.save
         count = count + 1
         end
      end

      
      redirect_to edit_story_path(@story)
  end
  
  def edit
      @story = Story.find(params[:id])
      @images = Image.where(:story_id, @story.id)
  end
  
  def update
     @story = Story.find(params[:id]) 
     @story.update(params[:story])
     
         if(params[:story][:img] != nil)
         count = 0
         params[:story][:img].each do 
             @image = @story.images.create(img: params[:story][:img][count])
             @image.artist_id = params[:story][:artist_id]
         @image.save
         count = count + 1
         end
        end
      
        id = 0
        params[:story][:images_attributes].values.each do |img|
            @image = Image.find(img[:id])
            @image.display = img[:display]
            @image.save
        end
        
        if(params[:delete_id] != nil)
            count = 0
            params[:delete_id].each do
                @image = Image.find(params[:delete_id][count])
                @image.destroy
                count = count + 1
            end
        end
     
     redirect_to edit_client_path(@story.client_id)
  end
end