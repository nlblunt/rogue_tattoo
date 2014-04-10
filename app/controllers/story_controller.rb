class StoryController < ApplicationController
  def new
      @story = Story.new
      @client = Client.find(params[:c_id])
      @artists = Artist.all
  end

  def create
      @story = Story.new(params[:story])
      @story.save
      
      @artists = Artist.all
      
      if(params[:story][:img] != nil)
         count = 0
         params[:story][:img].each do 
             @image = @story.images.create(img: params[:story][:img][count])
         #@image = Image.new
         #@image.story_id = @story.id
         #@image.img = params[:story][:img][count]
         @image.save
         count = count + 1
         end
      end

      
      redirect_to welcome_dashboard_path
  end
  
  def edit
      @story = Story.find(params[:id])
      #@images = Image.find_by story_id: @story.id
      #@images = Image.all(:conditions => ["story_id = ?", @story.id])
      @images = Image.where(:story_id, @story.id)
  end
end