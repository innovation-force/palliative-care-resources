class CommentsController < ApplicationController
	def create 
		@concern = Concern.find(params[:concern])
		@provider = Provider.find(params[:provider])
		@category = Category.find(params[:category])
		@service = Service.find(params[:service])
		@comment = @service.comments.create(comment_params)
		redirect_to :controller => "browse", :action => "servprovider", :service => @service.id, :provider => @provider.id, :category => @category.id, :concern => @concern.id

	end
	
	private 
		def comment_params 
			params.require(:comment).permit(:commenter, :body)
		end
	
end
