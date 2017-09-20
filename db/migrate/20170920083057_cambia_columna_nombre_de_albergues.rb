class CambiaColumnaNombreDeAlbergues < ActiveRecord::Migration[5.0]
  def change
    rename_column :albergues, :tipo, :nombre
  end
end
