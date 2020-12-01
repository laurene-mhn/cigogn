class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    if params[:code]
      find_user = User.find_by(code: params[:code])
      current_user.update(partner: find_user)
      find_user.update(partner: current_user)
      redirect_to profile_path
    elsif params[:unmatche]
      find_user = current_user.partner
      current_user.update(partner: nil)
      find_user.update(partner: nil)
      redirect_to profile_path
    end
  end
end
