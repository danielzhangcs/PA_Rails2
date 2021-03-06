class Course < ApplicationRecord
  validates :name, presence: true, uniqueness: {case_sensitive: false}

  has_many :enrollments, primary_key: :code, foreign_key: :course_code
  has_many :students, through: :enrollments, source: :user

  has_many :course_subjects, primary_key: :code, foreign_key: :course_code
  has_many :subjects, through: :course_subjects
end
