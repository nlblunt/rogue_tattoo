class HomeController < ApplicationController
  def index
      #Called for homepage.
      #Get all images that have display = true.  These are valid images for the
      #6 random pictures on the homepage
      @images = Image.where(display: true)
      
      #Get todays date.  This is needed to show only news that the current date is between
      @date = Date.today
      
      #Need to adjust start date (-1) and end_date (+1) for proper between.  Get all news that is current
      @news = Newspost.where("DATE(?) BETWEEN start_date AND end_date", @date)

      #If images.count > 0, then there are images that are available for display.  If not, no images, so skip
    if(@images.count > 0)
        #Setup empty arrays to store image url and artist name
        @url = Array.new()
        @art = Array.new()
        
        #If image count is > 5, then there are enough images for a unique image in each slot
        if(@images.count > 5)
            #get a 6 random images, shuffle, and store in LOC
            loc = (0..@images.count-1).to_a.shuffle[0,6]
            
            #Lets set all 6 images now
            (0..5).each do |i|
                #Push onto @url array the image url at the current location.  Get the :thumb sized url
                @url.push(@images[loc[i]].img.url(:thumb))
                #And get the Artist
                @artname = Artist.find(@images[loc[i]].artist_id)
                #Push the artist name onto the @art array
                @art.push(@artname.name)
            end
        
        #There are not enough images for 6 unique images, so just take what we have and fill all 6 slots
        else
        (0..5).each do |i|
            #Grab a random image from the total count
            loc = rand(@images.count)
            
            #Push onto @url array the image url at the current location.  Get the :thumb sized url
            @url.push(@images[loc].img.url(:thumb))
            #And get the Artist
            @artname = Artist.find(@images[loc].artist_id)
            #Push the artist name onto the @art array
            @art.push(@artname.name)
        end
        end
    #It seems we don't have any images that can be display.  Place a temp image of the logo in all 6 slots.
    else
        @url = Array.new(6, "logo.jpg")
        @art = Array.new(6, "Logo")
    end
  end
  
  def dashboard
    #Called when Dashboard is accessed
      #If someone is signed in
      if(admin_signed_in?)
          #Get the artists and newsposts
          @artists = Artist.all
          @newsposts = Newspost.all
      #User is not signed in
      else
          #Redirect to sign up page.  As this is an unpublised link, this needs to be manually typed in, so chance of abuse
          #is minimal.
          #TODO: Add more security to sign up path
          redirect_to new_admin_session_path
      end
  end
end
