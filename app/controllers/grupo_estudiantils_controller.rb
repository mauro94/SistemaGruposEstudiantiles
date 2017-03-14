class GrupoEstudiantilsController < ApplicationController
	def index
		@grupoestudiantils = GrupoEstudiantil.all
		@grupo = current_grupo
		@admin = current_admin
	end
	def show
		@grupoestudiantils = GrupoEstudiantil.find(params[:id])
		@grupo = current_grupo
		@admin = current_admin
	end
	def new
		@grupoestudiantil = GrupoEstudiantil.new
		@grupo = current_grupo
		@admin = current_admin
	end
	def create
		@grupoestudiantil = GrupoEstudiantil.new(grupoestudiantil_params)
		@grupo = current_grupo
		@admin = current_admin
		if @grupoestudiantil.save
			redirect_to '/home'
		else
			render 'new'
		end
	end
	def edit
		@grupoestudiantil = GrupoEstudiantil.find(params[:id])
		@grupo = current_grupo
		@admin = current_admin
	end

	def update
		@grupoestudiantil = GrupoEstudiantil.find(params[:id])
		@grupo = current_grupo
		@admin = current_admin
		if @grupoestudiantil.update(grupoestudiantil_params)
			redirect_to '/home'
		else
			render 'edit'
		end
	end
	private

	def grupoestudiantil_params
		params.require(:grupo_estudiantil).permit(:nombre,:cuentaBanco,:consejo)
	end
end
