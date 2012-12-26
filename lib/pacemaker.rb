# mixin to ApiReader to automatically pace calls to stay within rate limits
module Pacemaker
  def paced_load_feed
    data = old_load_feed
    pace = sleep_pace
    puts "Sleeping #{pace}" if pace > 0
    sleep pace
    data
  end

  def sleep_pace
    remaining = rate_limit_remaining
    return 0 if remaining > 10

    now = Time.now
    next_hour = now + (60 * 60)
    top_of_next_hour = Time.new(next_hour.year, next_hour.month, next_hour.day, next_hour.hour)
    seconds_until_reset = top_of_next_hour - now
    (seconds_until_reset / (remaining + 1)).to_i + 10
  end
end