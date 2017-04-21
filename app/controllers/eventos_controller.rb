class EventosController < ApplicationController 
	def index
		add_breadcrumb 'Inicio', '/admin/home'
		add_breadcrumb 'Eventos', '/admin/eventos'
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
		if current_admin
			add_breadcrumb 'Inicio', '/admin/home'
			add_breadcrumb 'Eventos', '/admin/eventos'
			add_breadcrumb @evento.nombre
		else
			add_breadcrumb 'Inicio', '/home'
			add_breadcrumb @evento.nombre
		end
		@admin = current_admin
		@ubicaciones = Ubicacion.all
		@grupo = (Grupo.joins(:eventos).where('grupos.id' => @evento.grupo_id)).first
		@avisos_consejo = Aviso.joins(:evento).where('avisos.evento_id' => @evento.folio).where('avisos.departamento' => 'Consejo')
		@avisos_finanzas = Aviso.joins(:evento).where('avisos.evento_id' => @evento.folio).where('avisos.departamento' => 'Finanzas')

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
		@avisos_consejo = Aviso.joins(:evento).where('avisos.evento_id' => @evento.folio).where('avisos.departamento' => 'Consejo')
		@avisos_finanzas = Aviso.joins(:evento).where('avisos.evento_id' => @evento.folio).where('avisos.departamento' => 'Finanzas')
		if @evento.update(evento_params)
			render 'edit'
		else
			redirect_to '/home'
		end
	end

	def aviso
		@admin = current_admin
		@evento = Evento.find(params[:id])
		@grupo = (Grupo.joins(:eventos).where('grupos.id' => @evento.grupo_id)).first
		@ubicaciones = Ubicacion.all
		@avisos_consejo = Aviso.joins(:evento).where('avisos.evento_id' => @evento.folio).where('avisos.departamento' => 'Consejo')
		@avisos_finanzas = Aviso.joins(:evento).where('avisos.evento_id' => @evento.folio).where('avisos.departamento' => 'Finanzas')
		if @evento.avisos.create(aviso_params)
			render 'edit'
		else
			redirect_to '/home'
		end
	end

	def reservar
		@evento = Evento.find(params[:id])
		@evento.ubicacions.new()
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
		params.require(:evento).permit(:nombre,:numAsistentes,:tipoEvento,:descripcion,:fechaInicio,:fechaFin,:horaInauguracion, :estatus, :archivoCartaContenido, :archivoCartaAsesor, :archivoCroquis, :archivoContactosElectricos, :archivoPresupuesto, :aprobadoConsejo, :aprobadoFinanzas, :aprobadoLogistica, :nombreAprobadoConsejo, :nombreAprobadoLogistica, :nombreAprobadoFinanzas, :fechaAprobadoConsejo, :fechaAprobadoLogistica, :fechaAprobadoFinanzas)
	end

	def aviso_params
		params.require(:aviso).permit(:mensaje, :departamento, :remitente, :consejo, :titulo)
	end
end
