class GrupoInController < ApplicationController
	before_action :authenticate_grupo!
	def home
		@grupo = current_grupo
		@eventos = Evento.all
	end
end
