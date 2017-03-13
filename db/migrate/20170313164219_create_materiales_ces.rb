class CreateMaterialesCes < ActiveRecord::Migration[5.0]
  def change
    create_table :materiales_ces, id: false, primary_key: :id do |t|
      t.integer :cantidad
      t.string :id
      t.float :largo
      t.float :ancho
      t.string :nombre
      t.string :material
      t.float :alto
      t.string :descripcion
      t.string :id
      t.string :ubicacion

      t.timestamps
    end
  end
end
