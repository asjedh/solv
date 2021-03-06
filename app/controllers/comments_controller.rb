class CommentsController < ApplicationController
  def create
    if !current_user
      @idea = Idea.find(params[:idea_id])
      @comments = @idea.comments
      @comment = @idea.comments.build
      flash.now[:alert] = "Must be signed in to comment."
      return render 'ideas/show'
    end
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @idea = Idea.find(params[:idea_id])

    @idea.comments << @comment
    if @comment.save
      flash[:notice] = "Your comment has been saved!"
      redirect_to idea_path(@idea)
    else
      @comments = @idea.comments
      flash.now[:alert] = "Your comment could not be added."
      render 'ideas/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
