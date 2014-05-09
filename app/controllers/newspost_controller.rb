class NewspostController < ApplicationController
    def new
        @newspost = Newspost.new
    end
    
    def create
        @newspost = Newspost.new(params[:newspost])
        @newspost.save
        
        redirect_to dashboard_path
    end
   
   def destroy
        @newspost = Newspost.find(params[:id])
        @newspost.destroy
        
        redirect_to dashboard_path
   end
   
   def edit
       @newspost = Newspost.find(params[:id]) 
   end
   
   def update
      @newspost = Newspost.find(params[:id])
      @newspost.update(params[:newspost])
      
      redirect_to dashboard_path
   end
end
