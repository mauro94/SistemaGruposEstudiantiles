class GrupoEstudiantil < ApplicationRecord
	has_many :eventos
	has_many :persona_tecs
	belongs_to :grupo, dependent: :destroy, touch: true
	has_many :alumnos

	auto_increment :id

	validates :nombre, :consejo, presence: true
	validates :cuentaBanco, presence: true, numericality: { only_integer: true }, length: { is: 8, too_short: "%{count} digitos" }
end
