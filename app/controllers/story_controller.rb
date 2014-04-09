class StoryController < ApplicationController
  def new
      @story = Story.new
      @client = Client.find(params[:c_id])
      @artists = Artist.all
  end

  def create
      @story = Story.new(params[:story])
      @artists = Artist.all
      
      if(params[:story][:img] != nil)
         count = 0
         params[:story][:img].each do 
         @image = Images.new
         @image.story_id = @story.id
         @image.img = params[:story][:img][count]
         @image.save
         count = count + 1
         end
      end
      @story.save
      
      redirect_to 'welcome#dashboard'
  end
  
  def edit
      @story = Story.find(params[:id])
      #@images = Images.find_by story_id: @story.id
      @images = Images.all(:conditions => ["story_id = ?", @story.id])
  end
end
