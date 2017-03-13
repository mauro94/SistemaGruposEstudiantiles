class CreateEventos < ActiveRecord::Migration[5.0]
  def change
    create_table :eventos, id: false, primary_key: :folio do |t|
      t.belongs_to :grupo_estudiantil, index: true
      t.string :nombre
      t.string :folio
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
      t.boolean :archivoCroquis
      t.boolean :archivoContactosElectricos
      t.boolean :archivoMercadotecnia
      t.boolean :archivoPresupuesto
      t.boolean :archivoAlimentos
      t.boolean :archivoAsistentes
      t.boolean :archivoVip

      t.timestamps
    end
  end
end
