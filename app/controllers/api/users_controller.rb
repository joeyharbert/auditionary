class Api::UsersController < ApplicationController
  def create
    user = User.new(
        first_name: params[:first_name],
        last_name: params[:last_name],
        email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation],
        phone: params[:phone],
        type: params[:type],
        union_status: params[:union_status].to_i
      )

    if user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end

  def index
    @users = User.all

    render 'index.json.jbuilder'
  end
end
