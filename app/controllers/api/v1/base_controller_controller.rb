class Api::V1::BasesController < ActionController::Base
	protect_from_forgery with: :null_session
  rescue_from "ActionController::ParameterMissing", with: :parameters_missing

	# This method returns the current user.
  # * *Args*:
  #   - none
  # * *Returns*:
  #   - Collention
  def get_users
    User.last
  end

  # This method responds with a success message.
  # * *Args*:
  #   - obj
  # * *Returns*:
  #   - Json
  def response_success(data = {})
    if data.keys.any?
      render status: 200, json: data
    else
      render status: 204, json: {}
    end
  end

  # This method is used when we successfully create a resource
  def response_created(data = {})
    render status: 201, json: data
  end

  # This method returns a 400 error message.
  # * *Args*:
  #   - error
  # * *Returns*:
  #   - Json
  def parameters_missing(error)
    response_error(code: 400, message: error.message)
  end

  def not_found(error)
    response_error(code: 404, message: error.message)
  end

  # This method response with a error message.
  # * *Args*:
  #   - code (http code)
  # * *Returns*:
  #   - Json
  def response_error(args = {})
    opts = { code: 420 }.merge(args)
    opts[:message] ||= t("api.http_response.errors.error_#{opts[:code]}")

    render status: opts[:code], json: {
      error: opts[:message]
    }
  end
end
