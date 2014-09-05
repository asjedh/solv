module ApplicationHelper
  def user_voted_on_idea?(user, idea)
    Vote.where(user: user, idea: idea).first
  end
end
