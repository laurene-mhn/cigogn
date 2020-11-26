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
    redirect_to names_path
  end

  def update
    @choice = Choice.find(params[:id])
    @choice.accepted = false
    @choice.save!
    redirect_to choices_path
  end
end
