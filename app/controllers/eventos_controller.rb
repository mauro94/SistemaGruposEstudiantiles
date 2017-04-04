class EventosController < ApplicationController 
	before_action :authenticate_grupo!
	def index
		@eventos = Evento.all
		@grupo = current_grupo
		@responsable = Grupo.joins(:eventos)
	end

	def show
		@evento = Evento.find(params[:id])
		@grupo = current_grupo
	end

	def new
		@evento = Evento.new
		@grupo = current_grupo
	end
	
	def create
		@grupo = current_grupo
		if @grupo.eventos.create(evento_params)
			redirect_to '/home'
		else
			render 'new'
		end
	end

	def edit
		@evento = Evento.find(params[:id])
		@grupo = current_grupo
	end

	def update
		@evento = Evento.find(params[:id])
		@grupo = current_grupo
		if @evento.update(evento_params)
			render 'edit'
		else
			redirect_to '/home'
		end
	end

	def destroy
		@evento = Evento.find(params[:id])
		if @evento.destroy
			redirect_to '/home'
		end
	end

	private

	def evento_params
		params.require(:evento).permit(:nombre,:numAsistentes,:tipoEvento,:descripcion,:fechaInicio,:fechaFin,:horaInauguracion, :estatus, :archivoCartaContenido, :archivoCartaAsesor, :archivoCroquis, :archivoContactosElectricos, :archivoPresupuesto)
	end
end
