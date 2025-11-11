module Api
  module V1
    class ResultsController < ApplicationController

      def index
        render json: Result.all
      end


      def create
        result = Result.new(result_params)
        if result.save
          render json: { status: 'success', id: result.id }, status: :created
        else
          render json: { status: 'error', errors: result.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def result_params
        params.require(:result).permit(:student_name, :subject, :marks, :submitted_at)
      end
    end
  end
end
