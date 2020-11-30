class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    if params[:code]
      current_user.update(partner: User.find_by(code: params[:code]))
    end
  end
end
