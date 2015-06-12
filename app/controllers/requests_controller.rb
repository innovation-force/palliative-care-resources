class RequestsController < ApplicationController
	before_action :authenticate_user!
	
	def index 
		@requests = Request.where(["resolved is false"])
	end
	
	def closed 
		@requests = Request.where(["resolved is true"])
	end
	
	def show 
		@request = Request.find(params[:id]) 
		redirect_to browse_path 
	end 
	
	def new 
		@request = Request.new 
	end 
	
	def edit 
		@request = Request.find(params[:id])

	end 
	
	def create 
		@request = Request.new(request_params) 
		
		if @request.save 
			redirect_to @request
		else 
			render 'new' 
		end 
	end 
	
	def update 
		@request = Request.find(params[:id]) 
		
		if @request.update(request_params) 
			redirect_to :action => 'index'
		else 
			render 'edit' 
		end 
	end 
	

	
	private 
		def request_params 
			params.require(:request).permit(:title, :req_type, :body, :parent_type, :parent_name, :user, :email, :resolved, :note); 
		end 
end
