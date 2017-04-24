class CreateUbicacions < ActiveRecord::Migration[5.0]
  def change
    create_table :ubicacions do |t|
    	t.string :zona
      t.string :nombre
    	t.integer :codigo
    	t.integer :capacidad
    	t.float :ancho
    	t.float :alto
    	t.time :horario_inicio
    	t.time :horario_fin
      t.string :croquis
      t.timestamps
    end
  end
end
