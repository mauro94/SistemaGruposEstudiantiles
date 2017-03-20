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
		@admins = Admin.paginate(:page => params[:page], :per_page => 10)
	end

	def new_admin
		@admin = current_admin
		@new_admin = Admin.new
	end

	def create
		@new_admin = Admin.new(admin_params)
		if @new_admin.save
			redirect_to '/admin/admins'
		else
			render 'new_admin'
		end
	end

	def edit
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
		@admin = current_admin
		@admins = Admin.paginate(:page => params[:page], :per_page => 10)
		@eventos = Evento.all
	end

	def grupos
		@admin = current_admin
		@grupos = Grupo.all
		@grupos = Grupo.paginate(:page => params[:page], :per_page => 10)
	end

	private

	def admin_params
		params.require(:admin).permit(:nombre,:apellido,:email,:puesto,:password,:password_confirmation,:extension,:departamento,:consejo,:oficina)
	end

end
