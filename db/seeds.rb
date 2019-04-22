# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# add times for all pre-existing time slots without start/end times

# time_slots = TimeSlot.where(start_time = nil)
# now = Time.now
# a_day_ago = now - 60 * 60 * 24

# time_slots.each do |ts|
#   start_time = rand(a_day_ago..now)
#   ts.start_time = start_time
#   ts.end_time = start_time + 600
#   ts.save
# end

# adds start times/end times for all pre-existing audition_days

# audition_days = AuditionDay.where(start_time = nil)

# audition_days.each do |a|
#   a.start_time = a.time_slots[0].start_time
#   a.end_time = a.time_slots[0].last.end_time
#   a.save
# end