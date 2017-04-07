class Evento < ApplicationRecord
	has_many :rentums
	has_many :materiales_ces, through: :rentums

	auto_increment :folio

	validates :nombre, :descripcion, :fechaInicio, :fechaFin, :horaInauguracion, :tipoEvento, presence: true
    validates :numAsistentes, presence: true, numericality: { only_integer: true }

    validate :fechaInicio_despues_actual?
    validate :fechaFin_after_fechaInicio?

def fechaFin_after_fechaInicio?
  if fechaFin < fechaInicio
    errors.add :fechaFin, "must be after start date"
  end
end

def fechaInicio_despues_actual?
    if fechaInicio <= Time.current + 3.days
        errors.add :fechaInicio, "No pues crear un evento antes de la fecha actual"
    end
end	

end
