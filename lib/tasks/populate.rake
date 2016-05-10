namespace :db do
	desc 'Erise and fill database with fake data'
	task populate: :environment do
		[User, Voting, Opinion].each(&:delete_all)

		user_voting =  FactoryGirl.create(:user)
		voting = FactoryGirl.create(:voting, user_id: user_voting.id)
		
		5.times do
			FactoryGirl.create(:user)
		end

		User.all.last(5).each do |user|
			7.times do
				FactoryGirl.create(:opinion, voting_id: voting.id, user_id: user.id)
			end
		end
	end

end
