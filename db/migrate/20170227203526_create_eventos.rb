class CreateEventos < ActiveRecord::Migration[5.0]
  def change
    create_table :eventos, id: false do |t|
      t.belongs_to :grupo, index: true
      t.integer :folio, null: false
      t.string :nombre
      t.string :descripcion
      t.boolean :aprobadoMercadotecnia
      t.boolean :aprobadoConsejo
      t.boolean :aprobadoLogistica
      t.boolean :aprobadoFinanzas
      t.string :nombreAprobadoConsejo
      t.string :nombreAprobadoLogistica
      t.string :nombreAprobadoFinanzas
      t.datetime :fechaAprobadoConsejo
      t.datetime :fechaAprobadoLogistica
      t.datetime :fechaAprobadoFinanzas
      t.boolean :revisadoAlimentos
      t.boolean :revisadoSeguridad
      t.string :ubicacion
      t.datetime :fechaFin
      t.datetime :fechaInicio
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
      t.string :archivoCartaContenido
      t.string :archivoCartaAsesor
      t.string :archivoConsejoOtro

      t.timestamps
    end

    add_index :eventos, :folio, unique: true

  end
end
