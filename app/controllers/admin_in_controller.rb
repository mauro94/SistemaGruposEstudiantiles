class AdminInController < ApplicationController
	before_action :authenticate_admin!
	add_breadcrumb 'Inicio', '/admin/home'
	def home
		@admin = current_admin
		@avisos = Aviso.all
		@eventos = Evento.all
		@weekstart = Date.current
		@day_1 = Date.current.at_beginning_of_week
		@day_2 = Date.current.at_beginning_of_week+1
		@day_3 = Date.current.at_beginning_of_week+2
		@day_4 = Date.current.at_beginning_of_week+3
		@day_5 = Date.current.at_beginning_of_week+4
		@day_6 = Date.current.at_beginning_of_week+5
		@day_7 = Date.current.at_beginning_of_week+6
		@events_day_1 = Evento.where(fechaInicio: @day_1..@day_1+1)
		@events_day_2 = Evento.where(fechaInicio: @day_2..@day_2+1)
		@events_day_3 = Evento.where(fechaInicio: @day_3..@day_3+1)
		@events_day_4 = Evento.where(fechaInicio: @day_4..@day_4+1)
		@events_day_5 = Evento.where(fechaInicio: @day_5..@day_5+1)
		@events_day_6 = Evento.where(fechaInicio: @day_6..@day_6+1)
		@events_day_7 = Evento.where(fechaInicio: @day_7..@day_7+1)

		@day_11 = Date.current.at_beginning_of_week+7
		@day_12 = Date.current.at_beginning_of_week+8
		@day_13 = Date.current.at_beginning_of_week+9
		@day_14 = Date.current.at_beginning_of_week+10
		@day_15 = Date.current.at_beginning_of_week+11
		@day_16 = Date.current.at_beginning_of_week+12
		@day_17 = Date.current.at_beginning_of_week+13
		@events_day_11 = Evento.where(fechaInicio: @day_11..@day_11+1)
		@events_day_12 = Evento.where(fechaInicio: @day_12..@day_12+1)
		@events_day_13 = Evento.where(fechaInicio: @day_13..@day_13+1)
		@events_day_14 = Evento.where(fechaInicio: @day_14..@day_14+1)
		@events_day_15 = Evento.where(fechaInicio: @day_15..@day_15+1)
		@events_day_16 = Evento.where(fechaInicio: @day_16..@day_16+1)
		@events_day_17 = Evento.where(fechaInicio: @day_17..@day_17+1)
	end

	def admins
		add_breadcrumb 'Administradores', '/admin/admins'
		@admin = current_admin
		@admins = Admin.paginate(:page => params[:page], :per_page => 10)
	end

	def new_admin
		add_breadcrumb 'Administradores', '/admin/admins'
		add_breadcrumb 'Nuevo Administrador'
		@admin = current_admin
		@new_admin = Admin.new
	end

	def create
		add_breadcrumb 'Administradores', '/admin/admins'
		add_breadcrumb 'Nuevo Administrador'
		@admin = current_admin
		@new_admin = Admin.new(admin_params)
		if @new_admin.save
			redirect_to '/admin/admins'
		else
			flash[:alert] = 'Error '
			render 'new_admin'
		end
	end

	def edit
		add_breadcrumb 'Administradores', '/admin/admins'
		add_breadcrumb 'Editar Administrador'
		@admin = current_admin
		@edit_admin = Admin.find(params[:id])
	end

	def update
		@update_admin = Admin.find(params[:id])
		if @update_admin.update(admin_params)
			redirect_to '/admin/admins'
		else
			render 'edit'
		end
	end

	def destroy
		@destroy_admin = Admin.find(params[:id])
		if @destroy_admin.destroy
			redirect_to '/admin/admins'
		end
	end

	def eventos
		add_breadcrumb 'Eventos', '/admin/eventos'
		@admin = current_admin
		@filter = Array.new
		@admins = Admin.paginate(:page => params[:page], :per_page => 10)
		if params[:estatus].blank? and params[:consejo].blank?
			@eventos = Evento.all
		elsif !params[:estatus].blank? and params[:consejo].blank?
			@estatus = params[:estatus]
			@eventos = Evento.where(:estatus => params[:estatus])
		elsif params[:estatus].blank? and !params[:consejo].blank?
			@consejo = params[:consejo]
			@aux = Grupo.where(:consejo => params[:consejo])
			@eventos = Evento.where(:grupo_id => @aux.select(:id))
		else
			@consejo = params[:consejo]
			@estatus = params[:estatus]
			@aux = Grupo.where(:consejo => params[:consejo])
			@eventos = Evento.where(:grupo_id => @aux.select(:id),:estatus => params[:estatus])
		end

	end

	def grupos
		add_breadcrumb 'Grupos', '/admin/grupos'
		@admin = current_admin
		@grupos = Grupo.all
		@grupos = Grupo.paginate(:page => params[:page], :per_page => 10)
	end

	private

	def admin_params
		params.require(:admin).permit(:email, :nombre,:apellido,:puesto,:password,:password_confirmation,:extension,:consejo,:oficina)
	end

end
