
class CommentsController < ApplicationController


  def create
    @idea = Idea.find params[:idea_id]
    @comments = Comment.new params_comments
    @comments.idea = @idea
    if @comments.save
      # redirect_to idea_comment_path(@ideas, @comments), notice: "comment"
      redirect_to idea_path(@idea), notice: "comment"
    else
      flash[:alert] = "oopppsss"
      render '/idea/show'
    end
  end

  def destory

  end
  def params_comments
    params.require(:comment).permit(:body, :idea_id)
  end
end
