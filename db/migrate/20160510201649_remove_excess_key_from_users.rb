class RemoveExcessKeyFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :voting_id, :integer
  	remove_column :users, :opinion_id, :integer
  	remove_column :users, :experience_id, :integer
  end
end
