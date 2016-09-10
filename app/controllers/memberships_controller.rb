class MembershipsController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_member, only: [:create]
    def create
        idea = Idea.find params[:idea_id]
        @membership = Membership.new user: current_user, idea: idea
      if @membership.save
            redirect_to root_path, notice: 'thanks for join'
        else
            redirect_to idea_path(idea), alert: @membership.errors.full_messages.join(', ')
      end
  end

    def destroy
        idea = Idea.find params[:idea_id]
        @membership = idea.memberships.find_by_user_id(session[:user_id])
        if can? :destroy, Membership
            @membership.destroy
            redirect_to root_path, notice: 'membership removed'
        else
            redirect_to root_path, alert: 'access denied'
        end
    end

    private

    def authorize_member
      idea = Idea.find params[:idea_id]
      redirect_to root_path, alert: "cannot like your own idea" if cannot? :membership, idea
    end
end
