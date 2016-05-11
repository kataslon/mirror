class VotingsController < ApplicationController

	before_action :set_voting, except: [:index]
	before_action :authenticate_user!

	def index
		@votings = current_user.votings
	end

	def show
	end

	private

	def set_voting
		@voting = Voting.find(params[:id])
	end

	def voting_params
		params.require(:voting).permit(:description)
	end
end
