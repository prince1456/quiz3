class LikesMailer < ApplicationMailer
  def notify_idea_owner(like)
    @user = like.user
    @idea = like.idea
    mail(to: @idea.user.email, subject: "#{@user.full_name} liked you post")
  end
end
