class AdministradorController < ApplicationController
	def new
		@admin = current_admin
		@grupo = current_grupo
		@administrador = Administrador.new
	end
end
