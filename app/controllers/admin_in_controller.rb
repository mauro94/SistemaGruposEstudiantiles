class AdminInController < ApplicationController
	before_action :authenticate_admin!
	def home
		@admin = current_admin
	end

	def admins
		@admin = current_admin
		@admins = Admin.paginate(:page => params[:page], :per_page => 10)
	end

	def eventos
		@admin = current_admin
		@admins = Admin.paginate(:page => params[:page], :per_page => 10)
	end

	def grupos
		@admin = current_admin
		@admins = Admin.paginate(:page => params[:page], :per_page => 10)
	end

end
