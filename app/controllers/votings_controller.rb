class VotingsController < ApplicationController

	before_action :set_voting, except: [:index, :new, :create]
	before_action :authenticate_user!

	def index
		@votings = current_user.votings
	end

	def new
		@voting = Voting.new
	end

	def create
		@voting = Voting.create(voting_params)
		if @voting.save
			redirect_to votings_url
		else
			redirect_to new_voting_url
		end
	end

	def show
	end

	def edit
	end

	def update
		@voting.update_attributes(voting_params)
		if @voting.save
			redirect_to votings_url
		else
			redirect_to edit_voting_url(@voting)
		end
	end

	def destroy
		@voting.destroy
		redirect_to votings_url
	end

	private

	def set_voting
		@voting = Voting.find(params[:id])
	end

	def voting_params
		params.require(:voting).permit(:polls_count, :description, :user_id)
	end
end
