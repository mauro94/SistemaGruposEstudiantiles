class GrupoMailer < ApplicationMailer
  def nuevo_evento(admin, grupo)
    @admin = admin
    @grupo = grupo
    mail(to: @admin.email, subject: 'Nuevo Evento')
  end

  def nueva_reservacion(admin, grupo, evento)
    @admin = admin
    @grupo = grupo
    @evento = evento
    mail(to: @admin.email, subject: 'Nueva Reservación')
  end
end
