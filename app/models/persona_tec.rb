class PersonaTec < ApplicationRecord
	belongs_to :grupo_estudiantil

	validates :nombre, :appellido, :puesto, presence: true
	validates :correoElectronico, presence: true, format: { with: /\A[^@]+@[^@]+\z/, message: "Correo invalido" }
    validates :telefono, presence: true, numericality: { only_integer: true }, length: { minimum: 8, too_short: "Mínimo %{count} digitos" }
end
