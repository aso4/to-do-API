class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  private

  def permission_denied_error
    error(403, 'Permission Denied!')
  end

  def error(status, message = 'Something went wrong')
    response = {
      response_type: "ERROR",
      message: message
    }

    render json: response.to_json, status: status
  end

  # check if the list being modified is owned by the authenticated user
  def authenticated?
    authenticate_or_request_with_http_basic do |username, password|
      user = User.where( username: username, password: password)
      list = List.where( user: user )
      user.present? && list.present?
    end
  end
end
