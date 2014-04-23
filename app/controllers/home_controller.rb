class HomeController < ApplicationController
  def index
      @artists = Artist.all
      @clients = Client.all
      @images = Image.where(display: true)
      @stories = Story.where(featured: true)
      

    if(@images.count > 0)
        @url = Array.new()
        (0..8).each do |i|
            loc = rand(@images.count)

            @url.push(@images[loc].img.url(:medium))
        end
    else
        @url = Array.new(8, "logo.jpg")
    end
    
  end
  
  def dashboard
      if(admin_signed_in?)
          #layout 'dashboard'
          
          @artists = Artist.all
          @clients = Client.all
      else
          redirect_to new_admin_session_path
      end
  end
end
