class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_422

    def create
        signup = Signup.create!(signup_params)
        render json: signup.activity, status: 201
    end

    ##### PRIVATE ######

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end

    def render_422(exception)
        render json: { errors: exception.record.errors.full_messages }, status: 422
    end
end
