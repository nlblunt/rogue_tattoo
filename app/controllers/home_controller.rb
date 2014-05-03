class HomeController < ApplicationController
  def index
      @artists = Artist.all
      @clients = Client.all
      @images = Image.where(display: true)
      @stories = Story.where(featured: true)
      

    if(@images.count > 0)
        @url = Array.new()
        (0..15).each do |i|
            loc = rand(@images.count)

            @url.push(@images[loc].img.url(:medium))
        end
    else
        @url = Array.new(12, "logo.jpg")
    end
        gon.url = @url
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
