class CommentsController < ApplicationController
  def create
  	@team = Team.where(id: params[:id]).first
  	@comment = Comment.new(comment_params)
  	@comment.team_id = @team.id
  	@comment.user_ip = request.remote_ip
  	unless @comment.save
      error_message = ""
      @comment.errors.messages.each do |key, values|
        values.each do |value|
          error_message += "・#{value}<br>"
        end
      end
      flash.now[:error] = I18n.t(:comment_entry_ng) + "<br>" + error_message
  		render template: "team/show" and return
  	end
    redirect_to team_path(id: @team.id)
  end

  private
    def comment_params
      params.require(:comment).permit(:name, :comment)
    end
end
