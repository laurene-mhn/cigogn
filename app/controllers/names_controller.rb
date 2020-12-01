class NamesController < ApplicationController
  def index
    names = policy_scope(Name).where.not(id: chosen_nameids)
    filter = current_user.filter
    if filter
      if filter.gender != "tous"
      # names = names.where(gender: filter.gender)
        names = names.where('gender = ?', filter.gender)
      end
      if filter.origin.any?
        names = names.where("origin && ARRAY[?]::varchar[]", filter.origin)
      end
      # if filter.length.any?
      #   names = names.select { |name| name.name.length => filter.length }
      # end
      if filter.popularity.any?
        names = names.where('popularity IN (?)', filter.popularity)
      end
      if filter.astrology.any?
        names = names.where('astrology IN (?)', filter.astrology)
      end
      # if filter.start_with.any?
      #   names = names.select { |name| name.name => filter.length }
      # end
      # if filter.end_with.any?
      #   names = names.select { |name| name.name.length > filter.length }
      # end

    end

    # names = names.where(origin: "french")
    # autant de ligne que de filtres
    names = names.reorder(Arel.sql("RANDOM()"))
    @name = names.first
    if @name.nil?
      redirect_to choices_path
    end
  end

  private
  def chosen_nameids
    current_user.choices.pluck(:name_id)
  end

#   def has_origin?
#   origin.any? { |text| text.include? "dog" }
# end
end
