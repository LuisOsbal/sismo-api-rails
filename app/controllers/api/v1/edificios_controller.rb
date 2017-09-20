class Api::V1::EdificiosController < Api::V1::BaseController
  before_action :busca_edificios, only: [:index]

  def index
    response_success edificios: @edificios
  end

  def create
    edificio = Edificio.new(edificio_params)

    if edificio.save
      response_success edificio: edificio
    else
      response_error message: edificio.errors.full_messages
    end
  end

  private

  def edificio_params
    params.require(:edificio).permit(
      :direccion,
      :colonia,
      :estado,
      :link,
      :notas
    )
  end

  # regresa todos los Edificios
  def busca_edificios
    @edificios = Edificio.all
  end
end
