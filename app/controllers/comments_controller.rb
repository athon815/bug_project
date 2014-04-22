class CommentsController < ApplicationController
	def create
		@request = Request.find(params[:request_id])
		@comment = Comment.create(comment_params)
		redirect_to request_path(@request)
	end

	def destroy
		@request = Request.find(params[:request_id])
		@comment = @request.comments.find(params[:id])
		@comment.destroy
		redirect_to request_path(@request)
	end

	private

	def comment_params
		params.require(:comment).permit(:request_id, :commenter, :body)
	end
end
