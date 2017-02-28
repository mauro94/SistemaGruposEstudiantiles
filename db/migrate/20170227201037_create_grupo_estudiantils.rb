class CreateGrupoEstudiantils < ActiveRecord::Migration[5.0]
  def change
    create_table :grupo_estudiantils, id: false, primary_key: :identificador do |t|
      t.string :nombre
      t.string :cuentaBanco
      t.string :consejo
      t.string :identificador

      t.timestamps
    end
  end
end
