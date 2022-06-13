class Employee < ApplicationRecord
  has_many :certificates
  has_many :skills
  has_many :educations
  has_many :experiences


  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
