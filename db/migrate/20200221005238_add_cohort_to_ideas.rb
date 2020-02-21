class AddCohortToIdeas < ActiveRecord::Migration[6.0]
  def change
    change_table :ideas do |t|
      t.references :cohort, null: false, foreign_key: true
    end
  end
end
