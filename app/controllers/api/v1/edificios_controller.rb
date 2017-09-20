class Api::V1::EdificiosController < Api::V1::BaseController
  before_action :busca_edificios, only: [:index]

  def index
    response_success edificios: @edificios
  end

  private
  # regresa todos los Edificios
  def busca_edificios
    @edificios = Edificio.all
  end
end
