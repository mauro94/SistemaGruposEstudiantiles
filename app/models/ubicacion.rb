class Ubicacion < ApplicationRecord
	has_many :reservas
	has_many :eventos, through: :reservas

	mount_uploader :croquis, ImagesUploader

	validates :zona, :croquis, presence: true
	validates :capacidad, :codigo, presence: true, numericality: { only_integer: true }
	validates :ancho, :alto, presence: true, numericality: true
end
