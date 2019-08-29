class StaticPageController < ApplicationController
  def index
    @teams = Team.order("created_at DESC").limit(10)
  end

  def help
  end

  def about
  end

  def rule
  end

  def owner
  end
end
