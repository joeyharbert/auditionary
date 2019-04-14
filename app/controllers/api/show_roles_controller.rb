class Api::ShowRolesController < ApplicationController
  def destroy
    show_role = ShowRole.find(params[:id])
    if current_user && (current_user.type == "Director")
      show_role.destroy

      render json: {message: "#{show_role.name} successfully deleted."}
    else
      render json: {}, status: :unauthorized
    end
  end
end
