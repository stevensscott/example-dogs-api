class DogsController < ApplicationController

  def create
    dog=Dog.new(
      name: params[:name],
      breed: params[:breed],
      age: params[:age]

    )
    if current_user
      if dog.save
        render json: dog.as_json  
     
       else
         render json: {message:product.errors.full_messages} ,status:422
      end
    else
      render json: {message: "User must be logged in."}
    end

  end
end
