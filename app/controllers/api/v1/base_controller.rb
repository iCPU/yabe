class Api::V1::BaseController < ActionController::Base
  respond_to :json
  before_filter :authenticate_user
  before_filter :check_rate_limit

  private
    def authenticate_user
      @current_user = User.find_by_authentication_token(params[:token])

      unless @current_user
        respond_with({:error => "Token is invalid." })
      end
    end

    def current_user
      @current_user
    end

    def check_rate_limit
      if @current_user.request_count > 100
        error = { :error => "Rate limit exceeded." }
        respond_with(error, :status => 403)
      else
        @current_user.increment!(:request_count)
      end
    end
end
