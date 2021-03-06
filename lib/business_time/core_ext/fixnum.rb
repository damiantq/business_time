# hook into fixnum so we can say things like:
#  5.business_hours.from_now
#  7.business_days.ago
#  3.business_days.after(some_date)
#  4.business_hours.before(some_date_time)
class Fixnum
  def business_hours
    BusinessTime::BusinessHours.new(self)
  end
  alias_method :business_hour, :business_hours

  def business_days currency = nil
    BusinessTime::BusinessDays.new(self, currency)
  end
  alias_method :business_day, :business_days
end
