class CreateDailyResultStats < ActiveRecord::Migration[8.0]
  def change
    create_table :daily_result_stats do |t|
      t.date :date
      t.string :subject
      t.integer :daily_low
      t.integer :daily_high
      t.integer :result_count

      t.timestamps
    end
  end
end
