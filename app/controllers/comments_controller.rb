class CommentsController < ApplicationController
	before_action :authenticate_user!, :except => [:create] 
	def create 
		@service = Service.find(params[:service_id])
		@comment = @service.comments.create(comment_params)
		redirect_to :back
	end
	
	def destroy 
		@service = Service.find(params[:service_id])
		@comment = @service.comments.find(params[:id])
		@comment.destroy 
		redirect_to :back
	end
	
	private 
		def comment_params 
			params.require(:comment).permit(:commenter, :body)
		end
	
end
