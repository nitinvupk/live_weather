class CommentsController < ApplicationController
  def create
    @city = City.find(params[:city_id])
    @comment = @city.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to root_path
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
