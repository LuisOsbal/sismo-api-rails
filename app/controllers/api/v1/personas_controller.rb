class Api::V1::PersonasController < Api::V1::BaseController
  before_action :busca_personas, only: [:index]
  before_action :busca_persona, only: [:update]

  def index
    response_success personas: @personas
  end

  def create
    persona = Persona.new(persona_params)

    if persona.save
      response_success persona: persona
    else
      response_error message: persona.errors.full_messages
    end
  end

  def update
    if @persona.update(persona_params)
      response_success persona: @persona
    else
      response_error message: @persona.errors.full_messages
    end
  end

  private

  def persona_params
    params.require(:persona).permit(
      :nombre,
      :sexo,
      :edad,
      :estado,
      :notas
    )
  end

  def busca_personas
    @personas = Persona.all
  end

  def busca_persona
    @persona = Persona.find(params[:id])
  end
end
