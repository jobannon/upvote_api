class CreateIdeas < ActiveRecord::Migration[6.0]
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :pitch
      t.text :problem
      t.text :solution
      t.text :audience
      t.text :features
      t.text :apis
      t.text :oauth
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
