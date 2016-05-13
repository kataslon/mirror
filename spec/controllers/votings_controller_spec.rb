require 'rails_helper'

RSpec.describe VotingsController, type: :controller do
	let!(:user) { create(:user) }
	let!(:voting) { create(:voting, user_id: user.id) }
	let!(:invited_user) { create(:user) }
	let!(:count) { user.votings.count }
	7.times do
		let!(:opinion) { create(:opinion, voting_id: voting.id, user_id: invited_user.id) }
	end

	context 'when user is logged in' do
		before :each do
			sign_in user
		end

		describe 'and user initiated vote' do

			describe 'GET#index' do
				it 'renders index template' do
					get :index
					expect(response).to render_template :index
				end
			end

			describe 'GET#new' do
				it 'renders new template' do
					get :new
					expect(response).to render_template :new
				end
			end

			describe 'POST#create' do
				describe 'whith inconsistent parameters' do
					it 'render new template' do
						post :create, voting: { polls_count: 3 }
						expect(response).to redirect_to new_voting_path
					end
				end

				describe 'with correct parameters' do
					it 'creates new voting' do
						expect{post :create, voting: { polls_count: 7 } }.to change(Voting, :count).by(1)
					end

					it 'redirect to index template' do
						post :create, voting: { description: 'first voting' }
						expect(response).to redirect_to votings_path
					end
				end
			end

			describe 'GET#show' do
				it 'renders show template' do
					get :show, id: voting
					expect(response).to render_template :show
				end
			end

			describe 'GET#edit' do
				it 'renders edit template' do
					get :edit, id: voting
					expect(response).to render_template :edit
				end
			end

			describe 'PUTCH#update' do
				describe 'whith inconsistent parameters' do
					it 'does not change voting' do
						patch :update, id: voting, voting: { polls_count: nil }
            expect(voting.reload.polls_count).to eq voting.polls_count
						expect(response).to redirect_to edit_voting_path
					end
				end

				describe 'whith inconsistent parameters' do
					it 'updates voting properties' do
						new_polls_count = 7
						patch :update, id: voting, voting: { polls_count: new_polls_count }
            expect(voting.reload.polls_count).to eq new_polls_count
						expect(response).to redirect_to votings_path
					end
				end
			end

			describe 'DELETE#destroy' do
				it 'renders destroy template' do
					voting
					expect{ patch :destroy, id: voting }.to change(Voting, :count).by(-1)
          expect{ Voting.find(voting.id) }.to raise_exception(ActiveRecord::RecordNotFound)
					expect(response).to redirect_to votings_path
				end
			end

		end

		describe 'and user is invited' do
			before { loging_whith invited_user }
		end
	end

	context 'when user is not logged in' do
		describe 'and user is invited' do
		end
	end

end
