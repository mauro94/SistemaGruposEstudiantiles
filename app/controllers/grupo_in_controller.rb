class GrupoInController < ApplicationController
	def new
		@grupo = Grupo.new
	end
	def create
		@grupo = Grupo.new(grupo_params)
		if @grupo.save
			redirect_to '/admin/grupos'
		else
			render 'new'
		end
	end
	def edit
		@grupo = Grupo.find(params[:id])
		@grupo = current_grupo
	end

	def update
		@grupo = Grupo.find(params[:id])
		if @grupo.update(administrador_params)
			redirect_to '/admin/grupos'
		else
			render 'edit'
		end
	end
	private

	def grupo_params
		params.require(:grupo).permit(:nombre,:cuentaBanco, :consejo)
	end
end
