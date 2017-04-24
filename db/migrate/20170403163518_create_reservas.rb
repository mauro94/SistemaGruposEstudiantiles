class CreateReservas < ActiveRecord::Migration[5.0]
  def change
    create_table :reservas do |t|
    	t.belongs_to :ubicacion, index: true
      t.belongs_to :evento, index: true
    	t.datetime :inicio
    	t.datetime :fin
      t.timestamps
    end
  end
end
