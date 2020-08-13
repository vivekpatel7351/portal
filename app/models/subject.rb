class Subject < ActiveRecord::Base
  belongs_to :standard
  has_many :user, as: :userable
end
