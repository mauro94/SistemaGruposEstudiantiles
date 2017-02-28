class Evento < ApplicationRecord
	has_one: grupo_estudiantil
	has_many: rentums
end
