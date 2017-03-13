class Rentum < ApplicationRecord
	belongs_to :evento
	belongs_to :materiales_ce

	auto_increment :folio

	validates :fecha, presence: true
	validates :cantidad, presence: true, numericality: { only_integer: true }
end
