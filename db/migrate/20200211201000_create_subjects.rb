class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects, id: false, primary_key: :subject_id do |t|
      t.string :name
      t.string :abbreviation
      t.string :subject_id

      t.timestamps
    end
  end
end
