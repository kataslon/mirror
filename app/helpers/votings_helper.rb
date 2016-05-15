module VotingsHelper

	def voting_status(voting)
		if voting.belongs_to_initiator?(current_user)
			'edit_form'
		else voting.in_opinions_stage?
			'opinions_form'
		end
	end
end
