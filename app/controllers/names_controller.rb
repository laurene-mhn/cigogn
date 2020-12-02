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
      if filter.length.any? && filter.length!= ["court 0-5car","moyen 6-9car", "long 10car & plus"]
        case filter.length
        when ["court 0-5car"]
          names = names.where("char_length(name) < ?", 6)
        when ["moyen 6-9car"]
          names = names.where("char_length(name) > ? AND char_length(name) < ?", 5, 10)
        when ["long 10car & plus"]
          names = names.where("char_length(name) > ?", 9)
        when ["court 0-5car", "moyen 6-9car"]
          names = names.where("char_length(name) < ?", 10)
        when ["moyen 6-9car", "long 10car & plus"]
          names = names.where("char_length(name) > ?", 5)
        when ["court 0-5car", "long 10car & plus"]
          names = names.where.not("char_length(name) > ? AND char_length(name) < ?", 5, 10)
        end
      end

      if filter.popularity.any?
        names = names.where('popularity IN (?)', filter.popularity)
      end
      if filter.astrology.any?
        names = names.where('astrology IN (?)', filter.astrology)
      end
      if !filter.start_with.blank?
        names = names.where("name LIKE :prefix", prefix: "#{filter.start_with.capitalize}%")
      end
      if !filter.end_with.blank?
        names = names.where("name LIKE :sufix", sufix: "%#{filter.end_with.downcase}")
      end
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
