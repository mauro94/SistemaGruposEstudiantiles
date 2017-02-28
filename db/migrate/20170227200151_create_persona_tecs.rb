class CreatePersonaTecs < ActiveRecord::Migration[5.0]
  def change
    create_table :persona_tecs, id: false, primary_key: :nomina do |t|
      t.string :nomina
      t.string :nombre
      t.string :apellido
      t.string :puesto
      t.string :telefono
      t.string :correoElectronico

      t.timestamps
    end
  end
end
