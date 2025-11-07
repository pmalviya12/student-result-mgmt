class CreateResults < ActiveRecord::Migration[8.0]
  def change
    create_table :results do |t|
      t.string :student_name
      t.string :subject
      t.integer :marks
      t.datetime :submitted_at

      t.timestamps
    end
  end
end
