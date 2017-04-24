class Reserva < ApplicationRecord
	belongs_to :evento
	belongs_to :ubicacion

	validates :inicio, :fin, presence: true
end
