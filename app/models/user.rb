class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         belongs_to :userable, polymorphic: true
  def is_teacher?
    userable_type == "Teacher"
  end

  def is_student?
    userable_type == "Student"
  end
end
