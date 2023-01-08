class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all
    # render json: cheeses, only: [:id, :name, :price] #specifies the params we want
    render json: cheeses, only: [:id, :name, :is_best_seller], methods: [:summary] #specifies the params we want + the method we called
    # render json: cheeses, except: [:create_at, :updated_at] #specifies the params we DON'T want
  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])

    if cheese
      render json: cheese
    else
      render json: { error: "Cheese not found" }, status: :not_found
    end
  end

end
