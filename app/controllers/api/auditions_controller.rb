class Api::AuditionsController < ApplicationController
  def create
    errors = []
    error_messages = {
      name: "Please type a name for your audition.",
      company_id: "Please select your company.",
      show_id: "Please pick a show to audition for.",
      start_time: "Please select a start time.",
      end_time: "Please select a end time.",
      time_slot_length: "Please select a length for each time slot"
    }

    error_messages.each do |k,v|
      if params[k] == ""
        errors << v
      end
    end
    if !/\A\d+\z/.match(params[:time_slot_length])
      errors << "Please select a whole number as the time slot length."
    end

    if current_user && (current_user.type == "Director")
      if errors != []
        render json: {errors: errors}, status: :bad_request
      else      
        start_time = Time.parse(params[:start_time])
        end_time = Time.parse(params[:end_time])

        @audition = AuditionDay.new(
          name: params[:name],
          length: end_time - start_time,
          requirements: params[:requirements],
          show_id: params[:show_id],
          active: false,
          company_id: params[:company_id],
          start_time: start_time,
          end_time: end_time
          )
        time_slot_length = params[:time_slot_length].to_i * 60
        if @audition.save
          num_of_slots = @audition.length / time_slot_length
          AuditionDayDirector.create(
            director_id: current_user.id, 
            audition_day_id: @audition.id
            )
          if params[:directors]
            directors = params[:directors].split(",")

            directors.each do |id|
             AuditionDayDirector.create(
              director_id: id.to_i, 
              audition_day_id: @audition.id
              ) 
            end
          end
          num_of_slots.times do
            end_time = start_time + time_slot_length
            TimeSlot.create(
                length: time_slot_length,
                audition_day_id: @audition.id,
                start_time: start_time,
                end_time: end_time
              )        
            start_time = end_time
          end
          render "show.json.jbuilder", status: :created
        else
          render json: {errors: @audition.errors.full_messages}, status: :bad_request
        end

      end
    else
      render json: {}, status: :unauthorized
    end
  end

  def index
    @auditions = AuditionDay.all
    render "index.json.jbuilder"     
  end

  def show
    @audition = AuditionDay.find(params[:id])
    render "show.json.jbuilder"     
  end

  def update
    audition = AuditionDay.find(params[:id])
    if current_user && ((current_user.type == "Director") && audition.directors.include?(current_user))   #if logged in as a director and is one of the directors of the day then update

      params.each do |k, v|
        if v == ""
          params[k] = nil
        end
      end

      audition.requirements = params[:requirements] || audition.requirements
      audition.show_id = params[:show_id] || audition.show_id
      audition.company_id = params[:company_id] || audition.company_id
      audition.name = params[:name] || audition.name
      audition.start_time = params[:start_time] || audition.start_time
      audition.start_time = Time.parse(audition.start_time)
      audition.end_time = params[:end_time] || audition.end_time
      audition.end_time = Time.parse(audition.end_time)
      audition.active = params[:active] || audition.active

      if audition.end_time < audition.start_time #make sure end time is after start time
        audition.end_time = Time.parse(audition.time_slots.last.end_time)
      end

      if params[:directors] #if param is given
        directors = params[:directors].split(",")
        directors.each do |id| #check each input
          if !audition.directors.include?(User.find(id)) #if the current id is
            AuditionDayDirector.create(
            director_id: id.to_i, 
            audition_day_id: audition.id
            )
          end
        end
      end

      if audition.save
        render json: {message: "#{audition.name} successfully updated"}
      else
        render json: {errors: audition.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {}, status: :unauthorized
    end
  end

  def destroy
    audition = AuditionDay.find(params[:id])
    if current_user && ((current_user.type == "Director") && audition.directors.include?(current_user))   #if logged in as a director and is one of the directors of the day then update
      audition.destroy
      render json: {message: "#{audition.name} successfully deleted"}
    else
      render json: {}, status: :unauthorized
    end
  end
end
