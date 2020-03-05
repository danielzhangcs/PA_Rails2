class Enrollment < ApplicationRecord
  validates :course_code, presence: true,
            uniqueness: {scope: :user_id}
  validates :user_id, presence: true

  belongs_to :course, primary_key: :code, foreign_key: :course_code
  belongs_to :user
end
