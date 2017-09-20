class CreateAlbergues < ActiveRecord::Migration[5.0]
  def change
    create_table :albergues do |t|
      t.integer :tipo
      t.text :direccion
      t.string :url

      t.timestamps
    end
  end
end
