class ChangeCohortsName < ActiveRecord::Migration[6.0]
  def change
    rename_column :cohorts, :cohort, :cohort_number
  end
end
