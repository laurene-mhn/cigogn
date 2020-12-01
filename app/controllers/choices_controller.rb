class ChoicesController < ApplicationController
  def index
    @choices = policy_scope(Choice)
    @choices_accepted = @choices.where(accepted: true)
    @choices_declined = @choices.where(accepted: false)
  end

  def create
    @choice = Choice.new
    authorize @choice
    @choice.user = current_user
    @choice.name = Name.find(params[:name_id])
    @choice.accepted = params[:decision] == "accepted"
    @choice.save!
    if @choice.accepted && Choice.find_by(user: current_user.partner, accepted: true , name: @choice.name)
    #   @match.new
      redirect_to names_path(match: @choice.name.name)
    else
      redirect_to names_path
    end
  end

  def update
    @choice = Choice.find(params[:id])
    authorize @choice
    @choice.accepted = false
    @choice.save!
    redirect_to choices_path
  end
end
