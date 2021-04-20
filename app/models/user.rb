class User < ApplicationRecord
  has_many :notes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: { message: 'Shoot! Someone is already using this email. Is it you...?'}


  def full_name
    self.first_name + ' ' + self.last_name
  end

end
