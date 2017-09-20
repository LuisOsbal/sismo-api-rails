class CreateEdificios < ActiveRecord::Migration[5.0]
  def change
    create_table :edificios do |t|
      t.string :direccion
      t.string :colonia
      t.string :estado
      t.string :link
      t.text :notas

      t.timestamps
    end
  end
end
