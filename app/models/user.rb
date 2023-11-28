class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  enum role: {buyer: 0, artisan: 1, admin: 2}

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
