class LikesController < ApplicationController
  # いいねボタンが押された
  def create
  	Rails.logger.debug(params[:id])
  	team = Team.where(id: params[:id]).first
    redirect_to team_path(id: params[:id]), notice: I18n.t(:system_error, scope: :message) and return if team.blank?
    log_in unless log_in?
    like = Like.new(
      team_id: team.id,
      session_key: current_session_key,
    )
    unless like.save
      redirect_to team_path(id: team.id), error: I18n.t(:session_key_error) and return
    end
    @like_num = Like.count_like(team)
    render action: :create
  end

  # いいねの取り消し
  def destroy
  	team = Team.where(id: params[:id]).first
    redirect_to team_path(id: params[:id]), notice: I18n.t(:system_error, scope: :message) and return if team.blank?
    redirect_to team_path(id: params[:id]), notice: I18n.t(:like_destroy_ng, scope: :message) and return unless log_in?
    like = Like.where(team_id: team.id, session_key: current_session_key).first
    like.destroy
    @like_num = Like.count_like(team)
    render action: :create
  end
end
