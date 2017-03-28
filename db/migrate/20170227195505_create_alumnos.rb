class CreateAlumnos < ActiveRecord::Migration[5.0]
  def change
    create_table :alumnos, id: false, primary_key: :matricula  do |t|
      t.belongs_to :grupo, index: true
      t.string :correoElectronico
      t.string :nombre
      t.string :apellido
      t.string :celular
      t.integer :semestre
      t.string :carrera
      t.string :matricula
      t.date :fechaInicio
      t.date :fechaFin

      t.timestamps
    end
  end
end
