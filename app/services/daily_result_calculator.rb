class DailyResultCalculator
  def initialize(date)
    @date = date
  end

  def perform
    subjects = Result.where(submitted_at: @date.all_day).pluck(:subject).uniq
    subjects.each do |subject|
      results = Result.where(subject: subject, submitted_at: @date.all_day)
      next if results.empty?

      DailyResultStat.create!(
        date: @date,
        subject: subject,
        daily_low: results.minimum(:marks),
        daily_high: results.maximum(:marks),
        result_count: results.count
      )
    end
  end
end
