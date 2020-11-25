class NamesController < ApplicationController
  def index
    names = Name.where.not(id: chosen_nameids)
    if true
      names = names.where(gender: "girl") && names.where(gender: "unisex")
    end
    # names = names.where(origin: "french")
    # autant de ligne que de filtres
    names = names.reorder(Arel.sql("RANDOM()"))
    @name = names.first
  end

  private
  def chosen_nameids
    current_user.choices.pluck(:name_id) 
  end
end
