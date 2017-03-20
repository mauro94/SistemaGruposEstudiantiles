class AdminInGruposController < ApplicationController
	def new
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

	private

	def grupo_params
		params.require(:grupo).permit(:nombre,:cuentaBanco,:consejo,:email,:password,:password_confirmation)
	end
end
