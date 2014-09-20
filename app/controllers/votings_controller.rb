class VotingsController < ApplicationController
  def new
    # team = Team.find(params[:team])
    # total = params[:total]
    # @voting = Voting.new(team: team, total: total)
  end

  def create
    @voting = Voting.new(params)

    if @voting.save
      redirect_to @voting
    else
      render 'new'
    end
  end

  def show
    @voting = Voting.find(params[:id])
  end

  def edit
    @voting = Voting.find(params[:id])
  end
end
