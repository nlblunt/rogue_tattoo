class NewspostController < ApplicationController
    def new
      #Called for a new Newspost
        @newspost = Newspost.new
        
        #Using Ajax
        respond_to do |format|
            format.js
        end
    end
    
    def create
      #Create a new newspost using params
        @newspost = Newspost.create(newspost_params)
        
        #Redirect to Dashboard
        redirect_to dashboard_path
    end
   
   def destroy
     #Destroy the newspost
        @newspost = Newspost.find(params[:id])
        @newspost.destroy
        
        #Redirect to Dashboard when done
        redirect_to dashboard_path
   end
   
   def edit
     #Called for the edit page.  Just the newspost
       @newspost = Newspost.find(params[:id]) 
       
       #Ajax call
       respond_to do |format|
           format.js
       end
   end
   
   def update
     #Time to update the newspost
      @newspost = Newspost.find(params[:id])
      
      #Update the newspost with new params[:newspost]
      @newspost.update_attributes!(newspost_params)#(params[:newspost])
      
      #Redirect to Dashboard
      redirect_to dashboard_path
   end

   #Used for strong params
   private
   def newspost_params
      params.require(:newspost).permit(:heading, :body, :start_date, :end_date)
   end
    
end