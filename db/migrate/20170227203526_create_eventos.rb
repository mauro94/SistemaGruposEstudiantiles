class CreateEventos < ActiveRecord::Migration[5.0]
  def change
    create_table :eventos, id: false, primary_key: :folio do |t|
      t.belongs_to :grupo_estudiantil, index: true
      t.string :nombre
      t.integer :folio
      t.string :descripcion
      t.boolean :aprobadoMercadotecnia
      t.boolean :aprobadoConsejo
      t.boolean :aprobadoLogistica
      t.boolean :aprobadoFinanzas
      t.boolean :revisadoAlimentos
      t.boolean :revisadoSeguridad
      t.string :ubicacion
      t.date :fechaFin
      t.date :fechaInicio
      t.integer :numAsistentes
      t.time :horaInauguracion
      t.string :estatus
      t.string :tipoEvento
      t.string :archivoCroquis
      t.string :archivoContactosElectricos
      t.string :archivoMercadotecnia
      t.string :archivoPresupuesto
      t.string :archivoAlimentos
      t.string :archivoAsistentes
      t.string :archivoVip

      t.timestamps
    end
  end
end
