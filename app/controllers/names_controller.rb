class NamesController < ApplicationController
  def index
    names = policy_scope(Name).where.not(id: chosen_nameids)
    if true
      names = names.where(gender: ["girl", "unisex"])
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
end
