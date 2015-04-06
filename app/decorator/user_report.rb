class Decorator::UserReport

  attr_reader :user, :records

  def self.decorate_collection(users)
    users_report = []
    users.each do |index, records|
      users_report << UserReport.new(records)
    end

    users_report
  end

  def initialize(records)
    @user    = records.first.user
    @records = records
  end

  def each_records
    records.each { |record| yield(record)}
  end

  def total_over_time
    over_time_records = records.select { |record| record.overtime? }
    total_time(over_time_records)
  end

  def total_absence
    absence_records = records.select { |record| record.absence? }
    total_time(absence_records)
  end

  def total_annual_leave
    annual_leave_records = records.select { |record| record.annual_leave? }
    total_time(annual_leave_records)
  end

  private

  def total_time(records)
    total_time = 0
    records.each do |record|
      total_time += (record.end_time - record.start_time)
    end

    total_time
  end
end