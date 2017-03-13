class Administrador < PersonaTec
	belongs_to :admin, dependent: :destroy, touch: true

	auto_increment :id

	validates :departamento, :consejo, presence: true

end
	