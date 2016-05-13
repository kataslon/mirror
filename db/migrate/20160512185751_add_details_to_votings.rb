class AddDetailsToVotings < ActiveRecord::Migration
  def change
    add_column :votings, :polls_count, :integer, default: 5
    add_column :votings, :description, :string
  end
end
