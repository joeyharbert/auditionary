class Api::AuditionsController < ApplicationController
  def create
    if current_user && (current_user.type == "Director")
      audition = AuditionDay.new(
        length: params[:length],
        requirements: params[:requirements],
        show_id: params[:show_id],
        active: false,
        company_id: params[:company_id]
        )
      time_slot_length = params[:time_slot_length].to_i
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
          TimeSlot.create(
              length: time_slot_length,
              audition_day_id: audition.id
            )        
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
    if current_user && (current_user.type == "Director")
      @auditions = current_user.audition_days
      render "director_index.json.jbuilder"      
    else
      render json: {}, status: :unauthorized
    end
  end

  def show
    if current_user && (current_user.type == "Director")
      @audition = AuditionDay.find(params[:id])
      render "director_show.json.jbuilder"      
    else
      render json: {}, status: :unauthorized
    end
  end
end
