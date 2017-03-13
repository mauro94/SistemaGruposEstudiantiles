class Alumno < ApplicationRecord
	validates :nombre, :apellido, :carrera, :fechaInicio, :fechaFin, presence: true
	validates :correoElectronico, presence: true, format: { with: /\A[^@]+@[^@]+\z/, message: "Correo invalido" }
    validates :celular, presence: true, numericality: { only_integer: true }, length: { minimum: 10, too_short: "Mínimo %{count} digitos" }
    validates :semestre, presence: true, numericality: { only_integer: true }, length: { in: 1..2 }
    validates :matricula, presence: true, uniqueness: true, format: { with: /[A-Za-z_]\d+/, message: "Matricula invalido" }
end
