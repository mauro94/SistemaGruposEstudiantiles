class EventosController < ApplicationController 
	def index
		@eventos = Evento.all.order("created_at DESC")
	end
	def show
	end
	def new
		@evento = Evento.new
	end
	def create
		@evento = Evento.new(evento_params)
		if @evento.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		 @evento = Evento.find(params[:id])
	end

	def update
		if @evento.update(evento_params)
			redirect_to root_path
		else
			render 'edit'
		end
	end

	def destroy
	end

	private

	def evento_params
		params.require(:evento).permit(:nombre,:descripcion)
	end
end
