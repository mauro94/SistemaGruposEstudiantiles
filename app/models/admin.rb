class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :consejo, :nombre, :apellido, :puesto, presence: true
  validates :extension, presence: true, numericality: { only_integer: true }, length: { minimum: 3, too_short: "mínimo %{count} digitos" }
  validates :oficina, presence: true, format: { with: /\A[^-]+-[0-9]+\z/, message: "Correo invalido" }

end
