class UbicacionsController < ApplicationController
	before_action :authenticate_admin!
	def index
			@admin = current_admin
			@ubicaciones = Ubicacion.all
	end
end
