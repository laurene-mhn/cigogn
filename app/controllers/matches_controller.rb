class MatchesController < ApplicationController
  def index
    @choices = policy_scope(Choice)
    @matches = @choices.where(accepted: true).select{ |choice| Choice.find_by(user: current_user.partner, accepted: true, name: choice.name) }
  end
end
