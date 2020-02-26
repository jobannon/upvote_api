class AddVoteCountToIdeas < ActiveRecord::Migration[6.0]
  def change
    add_column :ideas, :vote_count, :integer, default: 0
  end
end
