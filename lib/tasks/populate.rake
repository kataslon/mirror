namespace :db do
	desc 'Erise and fill database with fake data'
	task populate: :environment do
		[User, Voting, Opinion].each(&:delete_all)

		user_voting = FactoryGirl.create(:user, 
			                               email: 'user_voting@exemple.com',
			                               password: '12345678')
		voting = FactoryGirl.create(:voting, user_id: user_voting.id)
		
		4.times do
			FactoryGirl.create(:user)
		end

		FactoryGirl.create(:user, 
                       email: 'user@exemple.com',
                       password: '12345678')

		User.all.last(5).each do |user|
			7.times do
				FactoryGirl.create(:opinion, voting_id: voting.id, user_id: user.id)
			end
		end
	end

end
