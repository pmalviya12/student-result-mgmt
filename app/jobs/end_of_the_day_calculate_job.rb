class EndOfTheDayCalculateJob < ApplicationJob
  queue_as :default

  def perform
    DailyResultCalculator.new(Date.yesterday).perform
    MonthlyAverageCalculator.new.perform if monthly_calculation_day?
  end

  private

  # Monday of the week that contains the third Wednesday
  def monthly_calculation_day?
    today = Date.today
    monday = today.monday?
    third_wed = (1..31).map { |d| Date.new(today.year, today.month, d) }
                       .select { |d| d.wednesday? }[2]
    monday && (today..(today + 6)).cover?(third_wed)
  end
end
end