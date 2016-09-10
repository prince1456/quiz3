class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_like, only: [:create]

  def create
    idea  = Idea.find params[:idea_id]
    @like = Like.new user: current_user, idea: idea
    if @like.save
      LikesMailer.notify_idea_owner(@like).deliver_now
      redirect_to root_path, notice: "thanks for liked!"
    else
      redirect_to idea_path(idea), alert: @like.errors.full_messages.join(", ")
    end
  end
  def destroy
    idea = Idea.find params[:idea_id]
    like = idea.likes.find_by_user_id(session[:user_id])
    # like = Like.find params[:id]
    if can? :destroy, like
      like.destroy
      # redirect_to root_path, notice: "like removed! "
      redirect_to like.idea, notice: "Unliked"
    else
    redirect_to root_path, alert: "access denied"
    end
  end

  private

  def authorize_like
    idea = Idea.find params[:idea_id]
    redirect_to root_path, alert: "cannot like your own idea" if cannot? :like, idea
  end

end
