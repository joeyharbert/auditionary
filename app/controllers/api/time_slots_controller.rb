class Api::TimeSlotsController < ApplicationController
  def show
    @time_slot = TimeSlot.find(params[:id])

    if current_user
      # actor = nil
      if @time_slot.actor                         #this block checks if the current user is the owner of the time_slot
        if @time_slot.actor_id == current_user.id  
          actor = current_user.id
        end 
      end
      if (current_user.type == "Director") || actor #exists only if user == owner of ts
        render 'director_show.json.jbuilder'
      else
        render 'actor_show.json.jbuilder'
      end
    else
     render json: [], status: :unauthorized
    end
  end

  def update
    time_slot = TimeSlot.find(params[:id])

    if (current_user.id == time_slot.actor_id) || ["Director", "Proctor"].include?(current_user.type)   #if current user is owner actor or user is director/proctor
      if params[:actor_id] && ["Director", "Proctor"].include?(current_user.type)
        time_slot.actor_id = params[:actor_id]
      elsif params[:actor_id]
        time_slot.actor_id = current_user.id
      else
        time_slot.actor_id = nil; #if actor is removing themselves from timeslot
      end 
    end

    if current_user.type != "Actor"
      time_slot.start_time = params[:start_time] || time_slot.start_time
      time_slot.start_time = Time.parse(time_slot.start_time)
      time_slot.end_time = params[:end_time] || time_slot.end_time
      time_slot.end_time = Time.parse(time_slot.end_time)
      time_slot.length = params[:length] || time_slot.length
      time_slot.notes = params[:notes] || time_slot.notes

      if current_user.type == "Director"
        time_slot.sort = params[:sort].to_i || time_slot.sort
        if ["cast", "callback"].include?(time_slot.sort)  && params[:roles] #if actor is called back or cast for specific roles (array of IDs)
          roles = params[:roles].split(",")

          roles.each do |id|
            ShowRoleTimeSlot.create(
              show_role_id: id,
              time_slot_id: time_slot.id
              )
          end
        end
        time_slot.audition_day_id = params[:audition_day_id] || time_slot.audition_day_id
      end

      if time_slot.end_time < time_slot.start_time #make sure end time is after start time
        time_slot.end_time = Time.parse(time_slot.start_time) + time_slot.length
        time_slot.end_time = Time.parse(time_slot.end_time)
      end
    end

    if time_slot.save
      render json: {message: "Timeslot successfully updated"}
    else
      render json: {errors: time_slot.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    time_slot = TimeSlot.find(params[:id])

    if current_user && current_user.type != "Actor"
      time_slot.destroy
      render json: {message: "The timeslot has been deleted"}
    else
      render json: [], status: :unauthorized
    end
  end
end
