class Student < ActiveRecord::Base
  belongs_to :standard
  validates :name, presence: true
  validates :roll_number, presence: true
  validates :standard_id, presence: true
  validates :roll_number, uniqueness: { scope: :standard_id }
end
