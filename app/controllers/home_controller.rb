class HomeController < ApplicationController
  def index
      @artists = Artist.all
      @clients = Client.all
      @images = Images.where(display: '1')
      
    if(@images.count > 0)
        @url = Array.new()
        (0..8).each do |i|
            #@image = Images.order_by_rand.limit(1).where(display: 'true')
            @image = Images.where(display: 'true')
            @image = @image.order_by_rand.limit(1)
            @url.push(@image.img.url(:small))
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
