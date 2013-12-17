# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

set :output, "#{path}/log/chron"
job_type :script, "'#{path}/script/:task' :output"

# every 15.minutes do |variable|
#   command "rm '#{path}/tmp/cache/foo.txt"
# end

# every :sunday, at: "4:28AM " do
#   runner "Cart.clear_abandoned"
# end

every 5.minute do
  rake "price:check"
end


