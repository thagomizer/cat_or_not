class VotesController < ApplicationController
  before_action :set_vote, only: [:show]

  # GET /votes/1
  # GET /votes/1.json
  def show
  end

  # GET /votes/new
  def new
    @vote = Vote.new(:cat => Cat.find(params[:cat_id]))
    @cat = @vote.cat
  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(vote_params)
    @cat = @vote.cat_id

    respond_to do |format|
      # TODO Fix
      next_cat = Cat.all.sample

      if @vote.save
        format.html { redirect_to new_cat_vote_path(next_cat), notice: 'Vote was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:score, :cat_id)
    end
end
