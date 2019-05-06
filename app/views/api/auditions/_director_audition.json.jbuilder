json.id audition.id
json.name audition.name
json.start_time audition.start_time
json.end_time audition.end_time
json.requirements audition.requirements
json.active audition.active
json.company audition.company
json.directors do
  json.array! audition.directors.each do |director|
    json.id director.id
    json.first_name director.first_name
    json.last_name director.last_name
    json.email director.email
    json.phone director.phone
    json.union_status director.union_status
  end
end
json.show do
    json.id audition.show.id
    json.name audition.show.name
    json.description audition.show.description
    json.roles do
      json.array! audition.show.show_roles.each do |role|
        json.id role.id
        json.name role.name
        json.description role.description
      end
    end
end

json.time_slots do
  json.array! audition.time_slots.sort_by {|ts| ts.start_time}.each do |slot|
    json.id slot.id
    json.length slot.length
    json.start_time slot.start_time
    json.end_time slot.end_time
    json.sort slot.sort
    json.actor do
      if slot.actor
        json.partial! "/api/users/user.json.jbuilder", user: slot.actor
      end
    end

    json.headshot slot.headshot
  end
end