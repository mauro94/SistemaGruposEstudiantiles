class CreateEquipoAudiovisuals < ActiveRecord::Migration[5.0]
  def change
    create_table :equipo_audiovisuals, id: false, primary_key: :identificador do |t|
      t.belongs_to :inventario_ce, index: true
      t.string :identificador
      t.string :nombre
      t.string :descripcion
      t.string :marca

      t.timestamps
    end
  end
end
