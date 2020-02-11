class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :code
      t.string :description
      t.string :name
      t.boolean :independent_study
      

      t.timestamps
    end
  end
end
