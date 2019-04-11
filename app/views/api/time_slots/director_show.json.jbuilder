json.id @time_slot.id
json.length @time_slot.length
json.start_time @time_slot.start_time
json.end_time @time_slot.end_time
json.sort @time_slot.sort
json.actor do
  if @time_slot.actor
    json.partial! "/api/users/user.json.jbuilder", user: @time_slot.actor
  end
end