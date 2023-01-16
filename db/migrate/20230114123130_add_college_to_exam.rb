class AddCollegeToExam < ActiveRecord::Migration[7.0]
  def change
    add_reference :exams, :college, foreign_key: true
  end
end
