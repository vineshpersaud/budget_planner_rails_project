class User < ActiveRecord::Base
  has_many :events
  has_many :expenses, :through => :events
  
  validates :name, :presence => true
  validates :email, :presence => true
  validates :password_digest, :presence => true
  validates :email, :uniqueness => true 
  has_secure_password

  # scope method
  #scope :no_events, -> { joins(:events).where("events.budget_difference" < 0) }
                    
end
