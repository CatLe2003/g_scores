class CreateStudents < ActiveRecord::Migration[8.0]
  def change
    create_table :students do |t|
      t.string :registration_number
      t.float :math
      t.float :literature
      t.float :english
      t.float :physics
      t.float :chemistry
      t.float :biology
      t.float :history
      t.float :geography
      t.float :civic_education

      t.timestamps
    end
  end
end
