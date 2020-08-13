class Teacher < ActiveRecord::Base

has_one :user, as: :userable
end
