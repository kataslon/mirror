class RemoveOpinionIdFromVotings < ActiveRecord::Migration
  def change
  	remove_column :votings, :opinion_id, :integer
  end
end
