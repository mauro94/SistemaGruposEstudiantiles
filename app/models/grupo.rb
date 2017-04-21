class Grupo < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :eventos
  has_many :persona_tecs
  has_many :alumnos
  has_many :avisos

  validates :nombre, :consejo, presence: true
  validates :cuentaBanco, presence: true, numericality: { only_integer: true }, length: { is: 8, too_short: "%{count} digitos" }
end
