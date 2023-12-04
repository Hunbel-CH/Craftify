class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :handcrafted_items
  has_one :shopping_cart
  has_many :orders

  enum role: {
  buyer: 'buyer',
  artisan: 'artisan',
  admin: 'admin'
  }


  def set_default_role
    puts "Setting default role for user #{email}"
    self.role ||= :buyer
  end

  after_initialize :set_default_role, if: :new_record?

  def buyer?
    role == 'buyer'
  end

  def artisan?
    role == 'artisan'
  end

  def admin?
    role == 'admin'
  end
end
