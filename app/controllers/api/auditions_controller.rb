class Api::AuditionsController < ApplicationController
  def create
    if current_user && (current_user.type == "Director")
      start_time = Time.parse(params[:start_time])
      end_time = Time.parse(params[:end_time])
      audition = AuditionDay.new(
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
      num_of_slots = audition.length / time_slot_length
      if audition.save
        AuditionDayDirector.create(
          director_id: current_user.id, 
          audition_day_id: audition.id
          )
        if params[:directors]
          directors = params[:directors].split(",")

          directors.each do |id|
           AuditionDayDirector.create(
            director_id: id.to_i, 
            audition_day_id: audition.id
            ) 
          end
        end
        num_of_slots.times do
          end_time = start_time + time_slot_length
          TimeSlot.create(
              length: time_slot_length,
              audition_day_id: audition.id,
              start_time: start_time,
              end_time: end_time
            )        
          start_time = end_time
        end
        render json: {message: 'Auditon Day created successfully'}, status: :created
      else
        render json: {errors: audition.errors.full_messages}, status: :bad_request
      end
    else
      render json: {}, status: :unauthorized
    end
  end

  def index
    if current_user
      @auditions = AuditionDay.all
      render "index.json.jbuilder"     
    else
      render json: {}, status: :unauthorized
    end
  end

  def show
    if current_user
      @audition = AuditionDay.find(params[:id])
      render "show.json.jbuilder"     
    else
      render json: {}, status: :unauthorized
    end
  end
end
