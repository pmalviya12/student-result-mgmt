class CreateMonthlyAverages < ActiveRecord::Migration[8.0]
  def change
    create_table :monthly_averages do |t|
      t.date :start_date
      t.date :end_date
      t.string :subject
      t.float :avg_daily_low
      t.float :avg_daily_high
      t.integer :total_results_count
      t.integer :included_days_count

      t.timestamps
    end
  end
end
