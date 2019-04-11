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
end
