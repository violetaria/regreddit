class FixVotes < ActiveRecord::Migration
  def change
    change_column :Votes, :vote, :integer
    end
  
end
