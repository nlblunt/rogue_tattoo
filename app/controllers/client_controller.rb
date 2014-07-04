#This is a legacy file.
#Originally designed to track clients and client stories (jobs).  Site owner didn't see a need for
#this functionality so I have removed it to streamline the process.
#Saving this file incase this needs to be added back in.
class ClientController < ApplicationController
  def new
      @client = Client.new
  end

  def create
        @client = Client.new(params[:client])
       @client.save


       redirect_to dashboard_path    
  end
  
  def edit
      @stories = Story.all(:conditions => ["client_id = ?", params[:id]])
      @client = Client.find(params[:id])
  end
  
  def destroy
     @client = Client.find(params[:id])
     @stories = Story.all(:conditions => ["client_id = ?", params[:id]])
     
     #@stories.each do |story|
     #    story.destroy
     #end
     
     @client.destroy
     
     redirect_to dashboard_path
  end
  
  def client_params
      params.require(:client).permit(:firstname, :lastname)
  end
end