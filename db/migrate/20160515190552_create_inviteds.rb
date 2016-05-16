class CreateInviteds < ActiveRecord::Migration
  def change
    create_table :inviteds do |t|
      t.integer :voting_id
      t.string :name
      t.string :email
      t.string :description

      t.timestamps null: false
    end
  end
end
