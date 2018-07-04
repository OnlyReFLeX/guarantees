class User < ApplicationRecord
  DESIGNS = { 0 => 'Smart Default', 1 => 'Dark Elegance', 2 => 'Ultra Light', 3 => 'Google Skin',
              4 => 'Pixel Smash', 5 => 'Glass', 6 => 'MaterialDesign' }.freeze

  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable, :registerable
  validates :username, presence: true
  validates :design, presence: true, inclusion: 0..6
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
