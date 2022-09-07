class ActivitiesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_404

    def index
        activities = Activity.all
        render json: activities
    end

    def destroy
        activity = Activity.find_by!(id: params[:id])
        activity.destroy
        render json: {}, status: 204
    end


    ###### PRIVATE ######

    private

    def render_404
        render json: { error: "Activity not found" }, status: 404
    end

end
