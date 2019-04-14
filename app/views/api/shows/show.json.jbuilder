json.id @show.id
json.name @show.name
json.description @show.description
json.roles do
  json.array! @show.show_roles do |role|
    json.id role.id
    json.name role.name
    json.description role.description
  end
end