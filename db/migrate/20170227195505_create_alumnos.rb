class CreateAlumnos < ActiveRecord::Migration[5.0]
  def change
    create_table :alumnos, id: false, primary_key: :matricula  do |t|
      t.string :correoElectronico
      t.string :nombre
      t.string :apellido
      t.string :celular
      t.int :semestre
      t.string :carrera
      t.string :matricula

      t.timestamps
    end
  end
end
