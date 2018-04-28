class User < ApplicationRecord
  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable, :registerable
  validates :username, presence: true
  validate :validate_last_administrator, on: :update

  has_many :warranties
  has_many :calls

  def admin?
    is_a?(Admin)
  end

  private

  def validate_last_administrator
    if User.where(type: 'Admin').count <= 1 && type != 'Admin' && admin?
      errors.add(:base, 'Вы являетесь последним администратором.')
    end
  end
end
