class GrupoEstudiantil < ApplicationRecord
	has_many :eventos
	has_many :persona_tecs
	belongs_to :grupo
end
