class HomeController < ApplicationController
  def index
      #Called for homepage.
      
      #Get todays date.  This is needed to show only news that the current date is between
      @date = Date.today
      
      #Need to adjust start date (-1) and end_date (+1) for proper between.  Get all news that is current
      @news = Newspost.where("DATE(?) BETWEEN start_date AND end_date", @date)

      #Get the last 10 images for the carousel
      @images = Image.last(10)

  end
  
  def dashboard
    #Called when Dashboard is accessed
      #If someone is signed in
      if(admin_signed_in?)
          #Get the artists and newsposts
          @artists = Artist.all
          @makeupartists = Makeupartist.all
          @newsposts = Newspost.all
      #User is not signed in
      else
          #Redirect to sign up page.  As this is an unpublised link, this needs to be manually typed in, so chance of abuse
          #is minimal.
          #TODO: Add more security to sign up path
          redirect_to new_admin_session_path
      end
  end

  def about
    @about_us = File.read(Rails.root.join("public", "about_us.txt").to_s)
  end

  def edit_about_us
    @about_us = File.read(Rails.root.join("public", "about_us.txt").to_s)

    respond_to do |format|
      format.js
    end
  end

  def save_about_us
    File.open(Rails.root.join("public", "about_us.txt"), "w+") do |f|
      f.write(params[:desc])
    end
    flash[:notice] = "Updated About Us"
  

    redirect_to dashboard_path
  end

  def edit_admins
    @admins = Admin.all

    respond_to do |format|
      format.js
    end
  end

  def delete_admin
    a = Admin.find(params[:id])
    a.delete

    redirect_to dashboard_path
  end

  def admin_edit_images
    @images = Image.all

    respond_to do |format|
      format.js
    end
  end
end
