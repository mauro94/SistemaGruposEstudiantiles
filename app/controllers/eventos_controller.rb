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
		add_breadcrumb 'Inicio', '/home'
		add_breadcrumb 'Nuevo Evento'
		@evento = Evento.new
		@grupo = current_grupo
	end
	
	def create
		@grupo = current_grupo
		if @grupo.eventos.create(evento_params)
			@admins = Admin.where('admins.consejo = ?', @grupo.consejo)
			for a in @admins
				GrupoMailer.nuevo_evento(a, @grupo).deliver_now
			end
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
		@grupo = (Grupo.joins(:eventos).where('grupos.id' => @evento.grupo_id)).first
		@avisos_consejo = Aviso.joins(:evento).where('avisos.evento_id' => @evento.folio).where('avisos.departamento' => 'Consejo')
		@avisos_finanzas = Aviso.joins(:evento).where('avisos.evento_id' => @evento.folio).where('avisos.departamento' => 'Finanzas')
		@avisos_logistica = Aviso.joins(:evento).where('avisos.evento_id' => @evento.folio).where('avisos.departamento' => 'Logística')

		# validate reservation availability
		@ubicaciones = Ubicacion.where('ubicacions.id not in (?)', Ubicacion.joins(:reservas).where('ubicacions.id = reservas.ubicacion_id').where('(reservas.inicio < ? and reservas.fin > ?) or (reservas.inicio > ? and reservas.inicio < ?)', @evento.fechaInicio, @evento.fechaInicio, @evento.fechaInicio, @evento.fechaFin).select('id').distinct).where('ubicacions.id not in (?)',Ubicacion. where('(ubicacions.horario_inicio::time < ? and ubicacions.horario_fin::time > ?) or (ubicacions.horario_inicio::time > ? and ubicacions.horario_inicio::time < ?)', @evento.fechaInicio, @evento.fechaInicio, @evento.fechaInicio, @evento.fechaFin).select('id'))
	end

	def update
		@admin = current_admin
		@evento = Evento.find(params[:id])
		@grupo = (Grupo.joins(:eventos).where('grupos.id' => @evento.grupo_id)).first
		@ubicaciones = Ubicacion.where('ubicacions.id not in (?)', Ubicacion.joins(:reservas).where('ubicacions.id = reservas.ubicacion_id').where('(reservas.inicio < ? and reservas.fin > ?) or (reservas.inicio > ? and reservas.inicio < ?)', @evento.fechaInicio, @evento.fechaInicio, @evento.fechaInicio, @evento.fechaFin).select('id').distinct).where('ubicacions.id not in (?)',Ubicacion. where('(ubicacions.horario_inicio::time < ? and ubicacions.horario_fin::time > ?) or (ubicacions.horario_inicio::time > ? and ubicacions.horario_inicio::time < ?)', @evento.fechaInicio, @evento.fechaInicio, @evento.fechaInicio, @evento.fechaFin).select('id'))
		@avisos_consejo = Aviso.joins(:evento).where('avisos.evento_id' => @evento.folio).where('avisos.departamento' => 'Consejo')
		@avisos_finanzas = Aviso.joins(:evento).where('avisos.evento_id' => @evento.folio).where('avisos.departamento' => 'Finanzas')
		@avisos_logistica = Aviso.joins(:evento).where('avisos.evento_id' => @evento.folio).where('avisos.departamento' => 'Logística')
		if current_admin
			add_breadcrumb 'Inicio', '/admin/home'
			add_breadcrumb 'Eventos', '/admin/eventos'
			add_breadcrumb @evento.nombre
		else
			add_breadcrumb 'Inicio', '/home'
			add_breadcrumb @evento.nombre
		end
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
		@ubicaciones = Ubicacion.where('ubicacions.id not in (?)', Ubicacion.joins(:reservas).where('ubicacions.id = reservas.ubicacion_id').where('(reservas.inicio < ? and reservas.fin > ?) or (reservas.inicio > ? and reservas.inicio < ?)', @evento.fechaInicio, @evento.fechaInicio, @evento.fechaInicio, @evento.fechaFin).select('id').distinct).where('ubicacions.id not in (?)',Ubicacion. where('(ubicacions.horario_inicio::time < ? and ubicacions.horario_fin::time > ?) or (ubicacions.horario_inicio::time > ? and ubicacions.horario_inicio::time < ?)', @evento.fechaInicio, @evento.fechaInicio, @evento.fechaInicio, @evento.fechaFin).select('id'))
		@avisos_consejo = Aviso.joins(:evento).where('avisos.evento_id' => @evento.folio).where('avisos.departamento' => 'Consejo')
		@avisos_finanzas = Aviso.joins(:evento).where('avisos.evento_id' => @evento.folio).where('avisos.departamento' => 'Finanzas')
		@avisos_logistica = Aviso.joins(:evento).where('avisos.evento_id' => @evento.folio).where('avisos.departamento' => 'Logística')

		if current_admin
			add_breadcrumb 'Inicio', '/admin/home'
			add_breadcrumb 'Eventos', '/admin/eventos'
			add_breadcrumb @evento.nombre
		else
			add_breadcrumb 'Inicio', '/home'
			add_breadcrumb @evento.nombre
		end

		if @evento.avisos.create(aviso_params)
			render 'edit'
		else
			redirect_to '/home'
		end
	end

	def reservar
		@evento = Evento.find(params[:id])
		@reserva = Reserva.new
		@reserva.evento_id = @evento.folio
		@reserva.ubicacion_id = evento_params[:sede_id]
		@reserva.inicio = @evento.fechaInicio
		@reserva.fin = @evento.fechaFin
		@ubicaciones = Ubicacion.where('ubicacions.id not in (?)', Ubicacion.joins(:reservas).where('ubicacions.id = reservas.ubicacion_id').where('(reservas.inicio < ? and reservas.fin > ?) or (reservas.inicio > ? and reservas.inicio < ?)', @evento.fechaInicio, @evento.fechaInicio, @evento.fechaInicio, @evento.fechaFin).select('id').distinct).where('ubicacions.id not in (?)',Ubicacion. where('(ubicacions.horario_inicio::time < ? and ubicacions.horario_fin::time > ?) or (ubicacions.horario_inicio::time > ? and ubicacions.horario_inicio::time < ?)', @evento.fechaInicio, @evento.fechaInicio, @evento.fechaInicio, @evento.fechaFin).select('id'))
		@grupo = (Grupo.joins(:eventos).where('grupos.id' => @evento.grupo_id)).first
		@avisos_consejo = Aviso.joins(:evento).where('avisos.evento_id' => @evento.folio).where('avisos.departamento' => 'Consejo')
		@avisos_finanzas = Aviso.joins(:evento).where('avisos.evento_id' => @evento.folio).where('avisos.departamento' => 'Finanzas')
		@avisos_logistica = Aviso.joins(:evento).where('avisos.evento_id' => @evento.folio).where('avisos.departamento' => 'Logística')

		if current_admin
			add_breadcrumb 'Inicio', '/admin/home'
			add_breadcrumb 'Eventos', '/admin/eventos'
			add_breadcrumb @evento.nombre
		else
			add_breadcrumb 'Inicio', '/home'
			add_breadcrumb @evento.nombre
		end

		if @reserva.save
			@evento.sede_id = Reserva.last.id
			@evento.save
			render 'edit'
		else
			redirect_to '/home'
		end
	end

	def reservar_cambio
		@evento = Evento.find(params[:id])
		@reserva = Reserva.new
		@reserva.evento_id = @evento.folio
		@reserva.ubicacion_id = evento_params[:sede_id]
		@reserva.inicio = @evento.fechaInicio
		@reserva.fin = @evento.fechaFin
		@ubicaciones = Ubicacion.where('ubicacions.id not in (?)', Ubicacion.joins(:reservas).where('ubicacions.id = reservas.ubicacion_id').where('(reservas.inicio < ? and reservas.fin > ?) or (reservas.inicio > ? and reservas.inicio < ?)', @evento.fechaInicio, @evento.fechaInicio, @evento.fechaInicio, @evento.fechaFin).select('id').distinct).where('ubicacions.id not in (?)',Ubicacion. where('(ubicacions.horario_inicio::time < ? and ubicacions.horario_fin::time > ?) or (ubicacions.horario_inicio::time > ? and ubicacions.horario_inicio::time < ?)', @evento.fechaInicio, @evento.fechaInicio, @evento.fechaInicio, @evento.fechaFin).select('id'))
		@grupo = (Grupo.joins(:eventos).where('grupos.id' => @evento.grupo_id)).first
		@avisos_consejo = Aviso.joins(:evento).where('avisos.evento_id' => @evento.folio).where('avisos.departamento' => 'Consejo')
		@avisos_finanzas = Aviso.joins(:evento).where('avisos.evento_id' => @evento.folio).where('avisos.departamento' => 'Finanzas')
		@avisos_logistica = Aviso.joins(:evento).where('avisos.evento_id' => @evento.folio).where('avisos.departamento' => 'Logística')

		if current_admin
			add_breadcrumb 'Inicio', '/admin/home'
			add_breadcrumb 'Eventos', '/admin/eventos'
			add_breadcrumb @evento.nombre
		else
			add_breadcrumb 'Inicio', '/home'
			add_breadcrumb @evento.nombre
		end

		@eliminar_reserva = Reserva.find(@evento.sede_id)
		@eliminar_reserva.destroy

		if @reserva.save
			@evento.sede_id = Reserva.last.id
			@evento.save
			render 'edit'
		else
			redirect_to '/home'
		end
	end

	def cancel
		@evento = Evento.find(params[:id])
		@evento.estatus = 'cancelado'
		if @evento.sede_id != nil
			@eliminar_reserva = Reserva.find(@evento.sede_id)
			@eliminar_reserva.destroy
		end
		if @evento.save()
			redirect_to '/home'
		else
			render 'edit'
		end
	end

	private

	def evento_params
		params.require(:evento).permit(:nombre,:numAsistentes,:tipoEvento,:descripcion,:fechaInicio,:fechaFin,:horaInauguracion, :estatus, :archivoCartaContenido, :archivoCartaAsesor, :archivoCroquis, :archivoContactosElectricos, :archivoPresupuesto, :aprobadoConsejo, :aprobadoFinanzas, :aprobadoLogistica, :nombreAprobadoConsejo, :nombreAprobadoLogistica, :nombreAprobadoFinanzas, :fechaAprobadoConsejo, :fechaAprobadoLogistica, :fechaAprobadoFinanzas, :sede_id, :audiovisual, :materiales)
	end

	def aviso_params
		params.require(:aviso).permit(:mensaje, :departamento, :remitente, :consejo, :titulo)
	end
end
