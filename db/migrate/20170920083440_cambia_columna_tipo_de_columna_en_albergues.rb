class CambiaColumnaTipoDeColumnaEnAlbergues < ActiveRecord::Migration[5.0]
  def up
    change_column :albergues, :nombre, :string
  end

  def down
    change_column :albergues, :nombre, :integer
  end
end
