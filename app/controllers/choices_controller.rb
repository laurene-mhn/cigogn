class ChoicesController < ApplicationController
  def index
    # Avec pundit
    # @choices = policy_scope(Choice)
    @choices = Choice.where(user: current_user)
    @choices_accepted = @choices.where(accepted: true)
    @choices_declined = @choices.where(accepted: false)
  end

  def create
    @choice = Choice.new
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

# choices policy.
# scope.where(user: user)
