class Student < ApplicationRecord
  validates :registration_number, presence: true, uniqueness: true
  validates :math, :literature, :english, :physics, :chemistry, :biology, :history, :geography, :civic_education,
            numericality: { allow_nil: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
end
