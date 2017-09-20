class Api::V1::PersonasController < Api::V1::BaseController
  before_action :busca_personas, only: [:index]

  def index
    binding.pry
    response_success personas: @personas
  end

  private

  def busca_personas
    @personas = Persona.all
  end
end
