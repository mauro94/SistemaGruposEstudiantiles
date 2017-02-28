class CreateMobiliarios < ActiveRecord::Migration[5.0]
  def change
    create_table :mobiliarios, id: false, primary_key: :identificador do |t|
      t.float :largo
      t.float :ancho
      t.string :nombre
      t.string :material
      t.float :alto
      t.string :descripcion
      t.string :identificador

      t.timestamps
    end
  end
end
