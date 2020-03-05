class Subject < ApplicationRecord
  self.primary_key="subject_id"
  has_many :course_subjects, primary_key: :subject_id, foreign_key: :subject_id
  has_many :courses, through: :course_subjects, source: :course
end
