class GrupoMailer < ApplicationMailer
  def nuevo_evento(admin, grupo)
    @admin = admin
    @grupo = grupo
    mail(to: @admin.email, subject: 'Nuevo Evento')
  end
end
