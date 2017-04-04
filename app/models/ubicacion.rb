class Ubicacion < ApplicationRecord
	has_many :reservas
	has_many :eventos, through: :reservas

	validates :zona, :horarioInicio, :horarioFin, presence: true
	validates :capacidad, :numero, presence: true, numericality: { only_integer: true }
	validates :ancho, :alto, presence: true, numericality: true
end
