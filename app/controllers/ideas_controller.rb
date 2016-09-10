class IdeasController < ApplicationController
before_action :find_idea, only: [:show, :edit, :destory, :update]
before_action :authenticate_user!, except: [:index, :show]
  def index
    @ideas = Idea.all.order(created_at: :desc )
    # @user= User.new
    # @idea = Idea
    # @like =  @ideas.like_for(current_user)

  end

  def edit
    redirect_to root_path, alert: "access defined" unless can? :edit, @ideas
  end

  def show
    @idea = Idea.find params[:id]
    @user = @idea.user

    @comment = Comment.new
    @comments = Comment.all

  end

  def new
    @ideas = Idea.new
  end

  def create
       @ideas= Idea.new find_params
       @ideas.user = current_user
      if @ideas.save
        # @ideas.avatars[0].url # => '/url/to/file.png'
        #   @ideas.avatars[0].current_path # => 'path/to/file.png'
        #   @ideas.avatars[0].identifier #
        redirect_to ideas_path, notice: "ideas published successfully"
      else
        flash[:alert] = "ooops"
        render :new
      end

  end

  def update
    redirect_to root_path, alert: "access defined" unless can? :update, @ideas
    if @ideas.update find_params
      redirect_to idea_path(@ideas), notice: " updated"
    else
      flash[:alert] = "ooopppppsss"
      render :edit
    end
  end

  def destroy
    @ideas = Idea.find params[:id]
    redirect_to root_path, alert: "access defined" unless can? :destroy, @ideas
    @ideas.destroy
    redirect_to root_path, notice: " Idea deleted"

  end
  private

  def find_idea
   @ideas = Idea.find params[:id]
  end
  def find_params
    params.require(:idea).permit([:title, :body, :user_id, :image])
  end


  end
