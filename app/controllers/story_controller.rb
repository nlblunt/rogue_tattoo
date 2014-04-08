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
         @image = Images.new
         @image.story_id = @story.id
         @image.img = params[:story][:img]
         @image.save
      end
      @story.save
      
      render text: @story
  end
  
  def edit
  end
end
