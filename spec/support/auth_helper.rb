module AuthHelper
  def http_login(user, pass)
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pass)
  end
end
