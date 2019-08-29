class TeamsController < ApplicationController
  def index
    @team_form = TeamForm.new
    render "teams/new"
  end

  def show
  	@team = Team.where(id: params[:id]).first
    @comment = Comment.new
  end

  def new
  	@team_form = TeamForm.new
  end

  def create
  	@team_form = TeamForm.new(team_form_params)
  	unless @team_form.valid?
  	  error_mess = @team_form.errors.values.join("<br>").html_safe || ""
  	  flash.now[:error] = "入力内容にエラーがあります<br>" + error_mess
      render action: "new" and return
    end
    team_id = ""
    Team.transaction do
      begin
        team = Team.new(
          name: @team_form.team_name,
          author: @team_form.team_author,
          discription: @team_form.team_discription
        )
        team.save!
        @team_form.member_orders.each_with_index do |value, i|
          member = Member.new(
            team_id: team.id,
            order: value,
            name: @team_form.member_names[i],
            memo: @team_form.member_memos[i]
          )
          member.save!
        end
        team_id = team.id
      rescue => e
        flash.now[:error] = I18n.t(:system_error, scope: :message)
        render action: "show" and return
      end
    end
    redirect_to team_path(id: team_id), notice: I18n.t(:team_entry_ok, scope: :message)
  end

  private
    def team_form_params
      params.require(:team_form).permit(:team_name, :team_author, :team_discription, member_orders: [], member_names: [], member_memos: [])
    end
end
