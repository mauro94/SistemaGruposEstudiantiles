class Reserva < ApplicationRecord
	belongs_to :evento
	belongs_to :ubicacion

	validates :horario, presence: true
end
