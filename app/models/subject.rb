class Subject < ActiveRecord::Base
  belongs_to :standard
  validates :name, presence: true
  validates :name, uniqueness: { scope: :standard_id }
end
