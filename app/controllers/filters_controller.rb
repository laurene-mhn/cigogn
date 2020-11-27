class FiltersController < ApplicationController
  def new
    @filter = Filter.new
    authorize @filter
  end

  def create
    @filter = Filter.new(filter_params)
    @filter.user = current_user
    authorize @filter
    if @filter.save
      redirect_to names_path
    else
      render :new
    end
  end

  private

  def filter_params
    cleaned_params = params.require(:filter).permit(:gender, :hyphenated_name, :start_with, :end_with, origin: [], astrology: [], length: [], popularity: [])
    cleaned_params[:origin] = cleaned_params[:origin].reject { |value| value == "" }
    cleaned_params[:astrology] = cleaned_params[:astrology].reject { |value| value == "" }
    cleaned_params[:length] = cleaned_params[:length].reject { |value| value == "" }
    cleaned_params[:popularity] = cleaned_params[:popularity].reject { |value| value == "" }
    cleaned_params
  end
end
