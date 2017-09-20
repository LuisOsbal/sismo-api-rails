class CambiaTipoDeDataEnSexoPersonas < ActiveRecord::Migration[5.0]
  def up
    change_column :personas, :sexo, :string
  end

  def down
    change_column :personas, :sexo, :boolean
  end
end
