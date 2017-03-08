class AdminInController < ApplicationController
	before_action :authenticate_admin!
	def home
		@admin = current_admin
		@eventos = Evento.all
		@weekstart = Date.current
		@weekdos = @weekstart.at_beginning_of_week+7.days
	end

	def admins
		@admin = current_admin
		@eventos = Evento.all
		@admins = Admin.paginate(:page => params[:page], :per_page => 10)
	end

	def eventos
		@admin = current_admin
		@admins = Admin.paginate(:page => params[:page], :per_page => 10)
		@eventos = Evento.all
	end

	def grupos
		@admin = current_admin
		@eventos = Evento.all
		@admins = Admin.paginate(:page => params[:page], :per_page => 10)
	end

end
