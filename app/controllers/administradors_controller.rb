class AdministradorsController < ApplicationController
	def new
		@administrador = Administrador.new
		@admin = current_admin
	end
	def create
		@administrador = Administrador.new(administrador_params)
		if @administrador.save
			redirect_to '/admin/admins'
		else
			render 'new'
		end
	end
	def edit
		@administrador = Administrador.find(params[:id])
		@grupo = current_grupo
		@admin = current_admin
	end

	def update
		@administrador = Administrador.find(params[:id])
		if @administrador.update(administrador_params)
			redirect_to '/admin/admins'
		else
			render 'edit'
		end
	end
	private

	def administrador_params
		params.require(:administrador).permit(:nombre,:correo,:departamento,:consejo,:extension)
	end
end
