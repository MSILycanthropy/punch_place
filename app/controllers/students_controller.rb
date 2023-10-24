# frozen_string_literal: true

class StudentsController < AuthenticatedController
  before_action :set_student, only: %i[edit update]

  def index
    @students = Current.school.students
  end

  def new; end

  def edit; end

  def create; end

  def update
    @student.assign_attributes(student_params)

    if @student.save
      redirect_to students_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def student_params
    params.require(:student).permit(:name)
  end

  def set_student
    @student = Current.school.students.find(params[:id])
  end
end
