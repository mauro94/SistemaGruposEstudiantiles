class MaterialesCe < ApplicationRecord
	has_many :mobiliarios
	has_many :equipo_audiovisuals
	has_many :rentums
	has_many :eventos, through: :rentums

	auto_increment :id
	
	validates :cantidad, presence: true, numericality: { only_integer: true }
	validates :nombre, :material, :descripcion, :ubicacion, presence: true
	validates :largo, :ancho, :alto, numericality: true
end
