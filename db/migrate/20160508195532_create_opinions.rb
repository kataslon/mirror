class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.integer :user_id
      t.integer :voting_id
      t.integer :feature_id
      t.string :description
      t.integer :rate

      t.timestamps null: false
    end
  end
end
