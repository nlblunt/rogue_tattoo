class HomeController < ApplicationController
  def index
      @artists = Artist.all
  end
  
  def dashboard
      if(admin_signed_in?)
          @artists = Artist.all
      else
          redirect_to new_admin_session_path
      end
  end
end
