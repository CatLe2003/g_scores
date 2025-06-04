class StudentsController < ApplicationController
  def index
    @student = nil
  end

  def search
    @student = Student.find_by(registration_number: params[:registration_number])
    render :index
  end
end
