json.id @time_slot.id
json.length @time_slot.length
json.start_time @time_slot.start_time
json.end_time @time_slot.end_time
json.actor do
  if @time_slot.actor
    json.first_name @time_slot.actor.first_name
    json.last_name @time_slot.actor.last_name
  end
end