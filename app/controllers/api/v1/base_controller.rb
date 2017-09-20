class Api::V1::BaseController < ActionController::Base
	protect_from_forgery with: :null_session
  rescue_from "ActionController::ParameterMissing", with: :parameters_missing

  # This method responds with a success message.
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
  def parameters_missing(error)
    response_error(code: 400, message: error.message)
  end

  def not_found(error)
    response_error(code: 404, message: error.message)
  end

  # This method response with a error message.
  def response_error(args = {})
    opts = { code: 420 }.merge(args)
    opts[:message] ||= "Error"

    render status: opts[:code], json: {
      error: opts[:message]
    }
  end
end
