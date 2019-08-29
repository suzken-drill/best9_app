class StaticPageController < ApplicationController
  def index
    @teams = Team.order("created_at DESC").paginate(page: params[:page], per_page: 20)
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
