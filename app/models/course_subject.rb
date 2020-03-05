class CourseSubject < ApplicationRecord
  validates :course_code, presence: true
  validates :subject_id, presence: true

  belongs_to :course, primary_key: :code, foreign_key: :course_code
  belongs_to :subject, primary_key: :subject_id, foreign_key: :subject_id
end
