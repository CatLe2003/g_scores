class ReportsController < ApplicationController
  def index
    @grouped_data = grouped_score_levels
  end

  # First solution: Query multiple queries from database -> Too slow, not optimal as using 36 queries in total, not secure if hacker use SQL Injection
  def grouped_score_levels
    subjects = {
      "Math" => "math",
      "Literature" => "literature",
      "English" => "english",
      "Physics" => "physics",
      "Chemistry" => "chemistry",
      "Biology" => "biology",
      "History" => "history",
      "Geography" => "geography",
      "Civic Education" => "civic_education"
    }

    levels = {
      "Above 8" => ->(s) { Student.where("#{s} >= 8").count },
      "6 to 7.99" => ->(s) { Student.where("#{s} >= 6 AND #{s} < 8").count },
      "4 to 5.99" => ->(s) { Student.where("#{s} >= 4 AND #{s} < 6").count },
      "Below 4" => ->(s) { Student.where("#{s} < 4").count }
    }

    levels.map do |level_name, query|
      subject_data = subjects.map do |subject_name, field|
        [subject_name, query.call(field)]
      end.to_h
    
    # Chartkick return object like { name: , data: }
      { name: level_name, data: subject_data }
    end
  end
  def top_students
    @top_students = Student
      .select("registration_number, math, physics, chemistry, (math + physics + chemistry) AS total")
      .where.not(math: nil)
      .where.not(physics: nil)
      .where.not(chemistry: nil)
      .order("total DESC")
      .limit(10)
  end

end
