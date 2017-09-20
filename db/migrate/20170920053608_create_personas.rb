class CreatePersonas < ActiveRecord::Migration[5.0]
  def change
    create_table :personas do |t|
      t.string :nombre
      t.boolean :sexo
      t.integer :edad
      t.string :estado
      t.text :notas

      t.timestamps
    end
  end
end
