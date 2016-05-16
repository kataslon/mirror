class AddInvitationTextToVotings < ActiveRecord::Migration
  def change
  	add_column :votings, :invitation_text, :text
  end
end
