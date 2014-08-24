class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @idea = Idea.find(params[:idea_id])

    @idea.comments << @comment
    if @comment.save
      flash[:notice] = "Your comment has been saved!"
      redirect_to idea_path(@idea)
    else
      flash.now[:notice] = "There was an error."
      render 'ideas/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
