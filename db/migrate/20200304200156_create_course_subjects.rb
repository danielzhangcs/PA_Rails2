class CreateCourseSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :course_subjects do |t|
      t.string :course_code
      t.string :subject_id
      t.timestamps
    end
  end
end
