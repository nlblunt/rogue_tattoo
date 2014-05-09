class HomeController < ApplicationController
  def index
      @artists = Artist.all
      @clients = Client.all
      @images = Image.where(display: true)
      @stories = Story.where(featured: true)
      
      @date = Date.today
      @news = Newspost.where("DATE(?) BETWEEN start_date AND end_date", @date)

    if(@images.count > 0)
        @url = Array.new()
        @art = Array.new()
        
        (0..5).each do |i|
            loc = rand(@images.count)

            @url.push(@images[loc].img.url(:medium))
            @artname = Artist.find(@images[loc].artist_id)
            @art.push(@artname.name)
        end
    else
        @url = Array.new(6, "logo.jpg")
        @art = Array.new(6, "Logo")
    end
        gon.url = @url
  end
  
  def dashboard
      if(admin_signed_in?)
          #layout 'dashboard'
          
          @artists = Artist.all
          @clients = Client.all
          @newsposts = Newspost.all
      else
          redirect_to new_admin_session_path
      end
  end
end
