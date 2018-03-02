class PagesController < ApplicationController
  def home
    @quests = Quest.all
  end

  def about
  end

  def contact
  end
end
