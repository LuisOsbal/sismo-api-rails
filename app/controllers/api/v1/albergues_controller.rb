class Api::V1::AlberguesController < Api::V1::BaseController
  before_action :busca_albergues, only: [:index]

  def index
    response_success albergues: @albergues
  end

  private

  def busca_albergues
    @albergues = Albergue.all
  end
end
