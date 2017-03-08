class AdministradorsController < ApplicationController
	def new
		@administrador = Administrador.new
		@admin = current_admin
	end
end
