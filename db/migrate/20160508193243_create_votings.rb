class CreateVotings < ActiveRecord::Migration
  def change
    create_table :votings do |t|
      t.integer :opinion_id
      t.integer :user_id
      t.integer :environment_id

      t.timestamps null: false
    end
  end
end
