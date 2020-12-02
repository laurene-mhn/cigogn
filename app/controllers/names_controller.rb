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
      # Fonctionne UNIQUEMENT sur un des filtres
      # if filter.length.any?
      #   case filter.length
      #   when ["court 0-5car"]
      #     names = names.select{ |name| name.name.length >= 0 && name.name.length <= 5 }
      #   when ["moyen 6-9car"]
      #     names = names.select{ |name| name.name.length >= 6 && name.name.length <= 9 }
      #   when ["long 10car & plus"]
      #     names = names.select{ |name| name.name.length >= 10 }
      #   when ["court 0-5car", "moyen 6-9car"]
      #     names = names.select{ |name| name.name.length >= 0 && name.name.length <= 9 }
      #   when ["moyen 6-9car", "long 10car & plus"]
      #     names = names.select{ |name| name.name.length >= 6}
      #   when ["court 0-5car", "long 10car & plus"]
      #     names = names.select{ |name| name.name.length >= 10 || name.name.length <= 5 }
      #   when ["court 0-5car","moyen 6-9car", "long 10car & plus"]
      #     names = names.select{ |name| name.name.length >= 0}
      #   end
      # end
      # if filter.popularity.any?
      #   names = names.where('popularity IN (?)', filter.popularity)
      # end
      # if filter.astrology.any?
      #   names = names.where('astrology IN (?)', filter.astrology)
      # end
      # if filter.start_with.any?
      #   names = names.select { |name| name.name.start_with? filter.start_with.capitalize }
      # end
      # if filter.end_with.any?
      #   names = names.select { |name| name.name.end_with? filter.end_with.capitalize }
      # end
      # if filter.hyphenated_name == true
      #   names = names.where("name like ?", "%-%")
      # end
    end

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
