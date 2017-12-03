class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :firstname, :lastname, :presence => true
  validates_length_of :email, :maximum => 255
  validates_length_of :encrypted_password, :maximum => 255
  validates_length_of :firstname, :maximum => 255
  validates_length_of :lastname, :maximum => 255
  before_validation :strip_whitespaces_and_capitalize

  def strip_whitespaces_and_capitalize
      self.firstname = self.firstname.strip.capitalize if !self.firstname.nil?
      self.email = self.email.strip if !self.email.nil?
      self.lastname = self.lastname.strip.capitalize if !self.lastname.nil?
  end
end
