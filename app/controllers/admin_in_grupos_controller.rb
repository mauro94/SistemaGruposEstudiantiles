class AdminInGruposController < ApplicationController
	before_action :authenticate_admin!
	add_breadcrumb 'Inicio', '/admin/home'
	def new
		add_breadcrumb 'Grupos', '/admin/grupos'
		add_breadcrumb 'Nuevo Grupo'
		@admin = current_admin
		@grupo = Grupo.new
	end
	def create
		@admin = current_admin
		@grupo = Grupo.new(grupo_params)
		if @grupo.save
			redirect_to '/admin/grupos'
		else
			render 'new'
		end
	end
	def edit
		add_breadcrumb 'Grupos', '/admin/grupos'
		add_breadcrumb 'Editar Grupo'
		@admin = current_admin
		@grupo = Grupo.find(params[:id])
	end

	def update
		@grupo = Grupo.find(params[:id])
		if @grupo.update(grupo_params)
			redirect_to '/admin/grupos'
		else
			render 'edit'
		end
	end

	def destroy
		@grupo = Grupo.find(params[:id])
		if @grupo.destroy
			redirect_to '/admin/grupos'
		end
	end

	def update_activo
		@grupo = Grupo.find(params[:id])
		if @grupo.update(grupo_params)
			redirect_to '/admin/grupos'
		else
			redirect_to '/admin/grupos'
		end
	end

	private

	def grupo_params
		params.require(:grupo).permit(:nombre,:cuentaBanco,:consejo,:email,:password,:password_confirmation, :activo)
	end
end
