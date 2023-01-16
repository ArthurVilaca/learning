class AddExamToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :exam, foreign_key: true
    add_column :users, :start_time, :datetime
  end
end
