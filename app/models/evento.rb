class Evento < ApplicationRecord
	self.primary_key = 'folio'

	belongs_to :grupo
	has_many :reservas
	has_many :ubicacions, through: :reservas
	has_many :avisos

	mount_uploader :archivoCartaContenido, PdfDocUploader
	mount_uploader :archivoCartaAsesor, PdfDocUploader
	mount_uploader :archivoConsejoOtro, PdfDocUploader
	mount_uploader :archivoCroquis, PdfDocUploader
	mount_uploader :archivoContactosElectricos, PdfDocUploader
	mount_uploader :archivoPresupuesto, ExcelDocUploader

	auto_increment :folio

	validates :nombre, :descripcion, :fechaInicio, :fechaFin, :horaInauguracion, :tipoEvento, presence: true
    validates :numAsistentes, presence: true, numericality: { only_integer: true }
end
