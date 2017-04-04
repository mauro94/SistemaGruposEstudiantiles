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
			redirect_to '/'
		else
			render 'new'
		end
	end

	private

	def ubicacion_params
		params.require(:ubicacion).permit(:zona,:numero,:capacidad,:ancho,:alto,:horarioInicio, :horarioFin)
	end
end
