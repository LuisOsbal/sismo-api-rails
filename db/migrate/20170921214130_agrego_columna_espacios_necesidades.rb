class AgregoColumnaEspaciosNecesidades < ActiveRecord::Migration[5.0]
  def change
  	add_column :albergues, :espacios, :integer
  	add_column :albergues, :necesidades, :string, :default => "Sin definir"
  end
end
