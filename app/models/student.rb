class Student < ActiveRecord::Base
  belongs_to :standard
  has_many :user,as: :userable
  validates :name, presence: true
  validates :roll_number, presence: true
  validates :standard_id, presence: true
  validates :roll_number, uniqueness: { scope: :standard_id }
end
