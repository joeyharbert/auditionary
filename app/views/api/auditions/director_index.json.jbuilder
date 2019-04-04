json.array! @auditions.each do |audition|
  json.partial! "director_audition.json.jbuilder", audition: audition
end