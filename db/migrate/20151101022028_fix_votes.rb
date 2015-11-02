class FixVotes < ActiveRecord::Migration
  def change
    change_column :votes, :vote, :integer
    end
  
end
