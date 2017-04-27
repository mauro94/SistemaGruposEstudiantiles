class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :nombre, :apellido, :puesto, presence: true
  validates :extension, presence: true, numericality: { only_integer: true }
  validates :oficina, presence: true

end
