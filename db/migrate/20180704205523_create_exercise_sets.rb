class CreateExerciseSets < ActiveRecord::Migration[5.2]
  def change
    create_table :exercise_sets do |t|
      t.string :name, null: false
      t.string :description
      t.belongs_to :user, foreign_key: true, null: false

      t.timestamps
      t.index %i[name user_id], unique: true
    end
  end
end
