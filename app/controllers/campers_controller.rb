class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_422
    rescue_from ActiveRecord::RecordNotFound, with: :render_404

    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = Camper.find_by!(id: params[:id])
        render json: camper, serializer: CamperWithActivitiesSerializer
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: 201
    end

    ###### PRIVATE ######

    private

    def camper_params
        params.permit(:name, :age)
    end

    def render_404
        render json: { error: "Camper not found" }, status: 404
    end

    def render_422(exception)
        render json: { errors: exception.record.errors.full_messages }, status: 422
    end

end
