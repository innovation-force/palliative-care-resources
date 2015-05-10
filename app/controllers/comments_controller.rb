class CommentsController < ApplicationController
	def create 
		@service = Service.find(params[:service_id])
		@comment = @service.comments.create(comment_params)
		redirect_to :controller => "browse", :action => "servprovider" 
	end
	
	private 
		def comment_params 
			params.require(:comment).permit(:commenter, :body)
		end
	
end
