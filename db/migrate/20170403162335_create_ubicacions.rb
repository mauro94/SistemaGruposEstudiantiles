class CreateUbicacions < ActiveRecord::Migration[5.0]
  def change
    create_table :ubicacions do |t|
    	t.string :zona
    	t.integer :numero
    	t.integer :capacidad
    	t.float :ancho
    	t.float :alto
    	t.datetime :horarioInicio
    	t.datetime :horarioFin
      t.timestamps
    end
  end
end
