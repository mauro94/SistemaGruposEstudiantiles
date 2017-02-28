class InventarioCe < ApplicationRecord
	has_many: mobiliarios
	has_many: equipo_audiovisuals
	has_many: rentums
end
