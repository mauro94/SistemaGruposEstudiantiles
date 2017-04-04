class GrupoInController < ApplicationController
	before_action :authenticate_grupo!
	def home
		@grupo = current_grupo
		@eventos = Evento.joins(:grupo).where('eventos.grupo_id' => @grupo.id)
	end
end
