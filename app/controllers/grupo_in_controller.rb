class GrupoInController < ApplicationController
	before_action :authenticate_grupo!
	add_breadcrumb 'Inicio', '/home'
	def home
		@grupo = current_grupo
		@eventos = Evento.joins(:grupo).where('eventos.grupo_id' => @grupo.id)
		@eventos = Evento.paginate(:page => params[:page], :per_page => 10)
	end
end
