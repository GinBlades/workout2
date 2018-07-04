class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.belongs_to :exercise_set, foreign_key: true, null: false
      t.string :name, null: false
      t.string :description
      t.integer :duration, null: false, default: 30
      t.integer :position
      t.integer :rest, default: 10

      t.timestamps
    end
  end
end
