module AuthHelper
  def http_login
    user = 'admin'
    password = 'admin'
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user, password)
  end
end