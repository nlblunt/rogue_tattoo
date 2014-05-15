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
        
        if(@images.count > 5)
            loc = (0..@images.count-1).to_a.shuffle[0,6]
            logger.debug @images.count
            
            (0..5).each do |i|
                logger.debug i
                logger.debug loc[i]
                @url.push(@images[loc[i]].img.url(:thumb))
                @artname = Artist.find(@images[loc[i]].artist_id)
                @art.push(@artname.name)
            end
            
        else
        (0..5).each do |i|
            loc = rand(@images.count)

            @url.push(@images[loc].img.url(:thumb))
            @artname = Artist.find(@images[loc].artist_id)
            @art.push(@artname.name)

        end
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
