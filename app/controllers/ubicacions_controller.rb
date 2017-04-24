class UbicacionsController < ApplicationController
	before_action :authenticate_admin!
	add_breadcrumb 'Inicio', '/admin/home'

	def index
		add_breadcrumb 'Ubicaciones', '/ubicacions'
		@admin = current_admin
		@ubicaciones = Ubicacion.paginate(:page => params[:page], :per_page => 10)
	end

	def new
		add_breadcrumb 'Ubicaciones', '/ubicacions'
		add_breadcrumb 'Nueva Ubicación', '/ubicacions/new'
		@admin = current_admin
		@ubicacion = Ubicacion.new
	end

	def create
		@admin = current_admin
		@ubicacion = Ubicacion.new(ubicacion_params)
		if @ubicacion.save
			redirect_to '/ubicacions'
		else
			render 'new'
		end
	end

	def edit
		@admin = current_admin
		@ubicacion = Ubicacion.find(params[:id])
	end

	def update
		@admin = current_admin
		@ubicacion = Ubicacion.find(params[:id])
		if @ubicacion.update(ubicacion_params)
			redirect_to '/ubicacions'
		else
			render 'edit'
		end
	end

	def destroy
		@ubicacion = Ubicacion.find(params[:id])
		@admin = current_admin
		if @ubicacion.destroy
			redirect_to '/ubicacions'
		end
	end

	private

	def ubicacion_params
		params.require(:ubicacion).permit(:zona,:codigo,:capacidad,:ancho,:alto,:horario_inicio, :horario_fin, :croquis, :nombre)
	end
end
