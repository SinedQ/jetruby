class CreateLabReports < ActiveRecord::Migration[7.0]
  def change
    create_table :lab_reports do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.string :grade

      t.timestamps
    end
  end
end
