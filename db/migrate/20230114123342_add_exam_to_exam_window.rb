class AddExamToExamWindow < ActiveRecord::Migration[7.0]
  def change
    add_reference :exam_windows, :exam, foreign_key: true
  end
end
