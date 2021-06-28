class DogsController < ApplicationController
  def create
    dog = Dog.new(
      name: params[:name],
      age: params[:age],
      breed: params[:breed],
    )
    if current_user
      if dog.save
        render json: dog
      else
        render json: { errors: dog.errors.full_messages }
      end
    else
      render json: {}
    end
  end
end
