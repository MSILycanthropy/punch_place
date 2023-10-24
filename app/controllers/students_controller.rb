# frozen_string_literal: true

class StudentsController < AuthenticatedController
  before_action :set_student, only: %i[edit update show destroy]

  def index
    state = case params[:state]
            when 'active'
              true
            when 'inactive'
              false
            end

    @students = Current.school.students
    @students = @students.where(active: state) if params[:state].present?
  end

  def show; end

  def new
    @student = Current.school.students.new
  end

  def edit; end

  def create
    @student = Current.school.students.new(student_params)

    Current.school.students << @student

    if @student.save
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @student.assign_attributes(student_params)

    if @student.save
      redirect_to students_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @student.destroy!
  end

  private

  def student_params
    params.require(:student).permit(:name)
  end

  def set_student
    @student = Current.school.students.find(params[:id])
  end
end
