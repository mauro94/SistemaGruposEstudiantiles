class UbicacionsController < ApplicationController
	before_action :authenticate_admin!
	def index
			@admin = current_admin
			@ubicaciones = Ubicacion.paginate(:page => params[:page], :per_page => 10)
	end

	def new
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
		params.require(:ubicacion).permit(:zona,:numero,:capacidad,:ancho,:alto,:horarioInicio, :horarioFin)
	end
end
