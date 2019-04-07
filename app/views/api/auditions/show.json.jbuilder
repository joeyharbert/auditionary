if @audition.directors.include?(current_user)
  json.partial! "director_audition.json.jbuilder", audition: @audition
else
  json.partial! "actor_audition.json.jbuilder", audition: @audition
end