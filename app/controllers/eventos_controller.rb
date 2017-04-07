class EventosController < ApplicationController 
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
		@admin = current_admin
		@evento = Evento.find(params[:id])
		@ubicaciones = Ubicacion.all
		@grupo = (Grupo.joins(:eventos).where('grupos.id' => @evento.grupo_id)).first

		@nombres = Array.new(0)
		@ubicaciones.each do |u|
    		@nombres.push(u.zona)
    	end
	end

	def update
		@admin = current_admin
		@evento = Evento.find(params[:id])
		@grupo = (Grupo.joins(:eventos).where('grupos.id' => @evento.grupo_id)).first
		@ubicaciones = Ubicacion.all
		if @evento.update(evento_params)
			render 'edit'
		else
			redirect_to '/home'
		end
	end

	def cancel
		@evento = Evento.find(params[:id])
		@evento.estatus = 'cancelado'
		if @evento.save()
			redirect_to '/home'
		else
			render 'edit'
		end
	end

	private

	def evento_params
		params.require(:evento).permit(:nombre,:numAsistentes,:tipoEvento,:descripcion,:fechaInicio,:fechaFin,:horaInauguracion, :estatus, :archivoCartaContenido, :archivoCartaAsesor, :archivoCroquis, :archivoContactosElectricos, :archivoPresupuesto, :aprobadoConsejo)
	end
end
