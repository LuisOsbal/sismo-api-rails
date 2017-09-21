class Api::V1::PersonasController < Api::V1::BaseController
  before_action :busca_personas, only: [:index]
  before_action :busca_persona, only: [:update]
  include Filter

  def index
    @personas = filter(@personas) if params_present?
    response_success personas: @personas.order(:nombre)
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

  def filtering_params
    params.slice(:nombre, :sexo, :edad, :estado)
  end

  def params_present?
    filtering_params.values.select(&:present?).count.positive?
  end

  def busca_personas
    @personas = Persona.all
  end

  def busca_persona
    @persona = Persona.find(params[:id])
  end
end
