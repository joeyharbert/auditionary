class Api::ShowsController < ApplicationController
  def create
    if current_user && (current_user.type == "Director")
      show = Show.new(
        name: params[:name],
        description: params[:description]
        )
      roles = JSON.parse(params[:roles])
      if show.save
        if roles
          roles.each do |role|
            ShowRole.create(
              name: role["name"],
              description: role["description"],
              show_id: show.id
              )
          end
          render json: {message: 'Show created successfully'}, status: :created
        else  #right now we only return an error if there are no roles at all
          render json: {error: "Please create roles for the show"}, status: :bad_request
        end
      else
        render json: {errors: show.errors.full_messages}, status: :bad_request
      end
    else
      render json: {}, status: :unauthorized
    end
  end
end
