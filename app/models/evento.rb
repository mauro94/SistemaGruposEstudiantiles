class Evento < ApplicationRecord
	has_many :rentums
	has_many :materiales_ces, through: :rentums

	auto_increment :folio

	validates :nombre, :descripcion, :fechaInicio, :fechaFin, :horaInauguracion, :tipoEvento, presence: true
    validates :numAsistentes, presence: true, numericality: { only_integer: true }
end
