class AdminInController < ApplicationController
	before_action :authenticate_admin!
	def home
		@admin = current_admin
	end

	def show_admins
		@admin = current_admin
		@admins = Admin.paginate(:page => params[:page], :per_page => 10)
	end

	def new_admin
		@admin = current_admin
		@new_admin = current_admin
	end

	def show_eventos
		@admin = current_admin
		@admins = Admin.paginate(:page => params[:page], :per_page => 10)
	end

	def show_grupos
		@admin = current_admin
		@admins = Admin.paginate(:page => params[:page], :per_page => 10)
	end

end
