class Api::V1::AlberguesController < Api::V1::BaseController
  before_action :busca_albergues, only: [:index]
  before_action :busca_albergue, only: [:update]


  def index
    response_success albergues: @albergues
  end


  def create
    albergue = Albergue.new(albergue_params)

    if albergue.save
      response_success albergue: albergue
    else
      response_error message: albergue.errors.full_messages
    end
  end

  def update
    if @albergue.update(albergue_params)
      response_success albergues: @albergue
    else
      response_error message: @albergue.errors.full_messages
    end
  end

  private

  def albergue_params
    params.require(:albergues).permit(
      :nombre,
      :direccion
    )
  end

  def busca_albergues
    @albergues = Albergue.all
  end

  def busca_albergue
    @albergue = Albergue.find(params[:id])
  end
end
