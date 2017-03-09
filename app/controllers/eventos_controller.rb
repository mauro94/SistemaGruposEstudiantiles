class EventosController < ApplicationController 

	def index
		@eventos = Evento.all
		@grupo = current_grupo
		@admin = current_admin
	end
	def show
		@evento = Evento.find(params[:id])
		@grupo = current_grupo
		@admin = current_admin
	end
	def new
		@evento = Evento.new
		@grupo = current_grupo
		@admin = current_admin
	end
	def create
		@evento = Evento.new(evento_params)
		if @evento.save
			redirect_to '/home'
		else
			render 'new'
		end
	end

	def edit
		@evento = Evento.find(params[:id])
		@grupo = current_grupo
		@admin = current_admin
	end

	def update
		@evento = Evento.find(params[:id])
		if @evento.update(evento_params)
			redirect_to '/home'
		else
			render 'edit'
		end
	end

	def destroy
	end

	private

	def evento_params
		params.require(:evento).permit(:nombre,:descripcion,:estatus,:fechaInicio,:fechaFin,:revisadoSeguridad)
	end
end
