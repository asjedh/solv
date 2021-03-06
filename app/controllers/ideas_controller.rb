class IdeasController < ApplicationController
  before_action :authenticate_user!, except: [:show, :search]

  def index
    @ideas = Idea.where(user: current_user)
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user = current_user

    if @idea.save
      flash[:notice] = "Your idea has been added!"
      redirect_to idea_path(@idea)
    else
      flash.now[:notice] = "Your idea could not be added. See errors below."
      render :new
    end
  end

  def show
    @idea = Idea.find(params[:id])
    @comments = @idea.comments
    @comment = @idea.comments.new
  end

  def create_vote
    idea = Idea.find(params[:idea_id])
    Vote.create(user: current_user, idea: idea)
    redirect_to idea_path(idea)
  end

  def destroy_vote
    idea = Idea.find(params[:idea_id])
    Vote.where(user: current_user, idea: idea).first.destroy
    redirect_to idea_path(idea)
  end

  def search
    @ideas = Idea.search(params[:search]).order('created_at DESC')
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :abstract, :body, category_ids: [])
  end

end
