class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.string :user_id
      t.string :idea_id
      t.string :cohort_id
    end
  end
end
