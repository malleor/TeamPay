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

  def update
    # render plain: params

    voting = Voting.find(params[:id])
    amounts = params[:amount]
    amounts.each do |member_id, amount|
      entry = VotingEntry.where(voting_id: voting.id(), member_id: member_id).first
      entry.update(amount: amount)
    end

    redirect_to voting
  end

  def show
    @voting = Voting.find(params[:id])
  end

  def edit
    @voting = Voting.find(params[:id])
  end
end
