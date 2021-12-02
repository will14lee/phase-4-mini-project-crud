class SpicesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        spices= Spice.all
        render json: spices
    end

    def destroy
        spice= find_spice
        spice.destroy
        render json: spice

    end

    def update
        spice= find_spice
        spice.update(spice_params)
        render json: spice
    end

    def create
        spice= Spice.create(spice_params)
        render json: spice, status: :created
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def find_spice
        Spice.find(params[:id])
    end

    def render_not_found_response
        render json: { error:"Spice not Found" }, status: :not_found
    end

end
