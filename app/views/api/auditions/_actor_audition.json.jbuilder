json.id audition.id
json.name audition.name
json.length audition.length
json.requirements audition.requirements
json.active audition.active
json.directors do
  json.array! audition.directors.each do |director|
    json.id director.id
    json.first_name director.first_name
    json.last_name director.last_name
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
  json.array! audition.time_slots.each do |slot|
    json.id slot.id
    json.length slot.length
    json.sort slot.sort
    json.actor do
      if slot.actor
        json.first_name slot.actor.first_name
        json.last_name slot.actor.last_name
      end
    end
  end
end