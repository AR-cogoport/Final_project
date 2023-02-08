class ApplicationController < ActionController::Base
    # skip_before_action :verify_authenticity_token

    def not_found
        render json: { error: 'not_found' }
      end
    
      def authorize_request
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        begin
          @decoded = JsonWebToken.decode(header)
          @current_user = Author.find(@decoded[:user_id])
        rescue ActiveRecord::RecordNotFound => e
          render json: { errors: e.message, test: "test" }, status: :unauthorized
        rescue JWT::DecodeError => e
          render json: { errors: e.message, test: "test2" }, status: :unauthorized
        end
      end
end
