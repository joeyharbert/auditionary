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

  def index
    @shows = Show.all
    render 'index.json.jbuilder'
  end

  def show
    @show = Show.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @show = Show.find(params[:id])

    if current_user && (current_user.type == "Director")
      @show.name = params[:name] || @show.name
      @show.description = params[:description] || @show.description

      if @show.save
        new_roles = JSON.parse(params[:roles])

        if new_roles
          new_roles.each do |new_role|
            old_role = ShowRole.find(new_role["id"])
            old_role.name = new_role["name"] || old_role.name
            old_role.description = new_role["description"] || old_role.description
            old_role.save
          end
        end
        render 'show.json.jbuilder'
      else
        render json: {errors: @show.errors.full_messages}, status: :bad_request
      end
    else
      render json: {}, status: :unauthorized          
    end
  end

  def destroy
    show = Show.find(params[:id])

    if current_user && (current_user.type == "Director")
      show.show_roles.each do |role|
        role.destroy
      end

      show.destroy
      render json: {message: "#{show.name} has been deleted."}
    else
      render json: {}, status: :unauthorized                
    end

  end
end
