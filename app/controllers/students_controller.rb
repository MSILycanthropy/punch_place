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

  def new; end

  def edit; end

  def create; end

  def update
    @student.assign_attributes(student_params)

    if @student.save
      redirect_to students_path

      @student.broadcast_replace_to('students',
                                    partial: 'students/student')
      @student.broadcast_replace(partial: 'students/show')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @student.destroy!

    @student.broadcast_remove_to('students')
  end

  private

  def student_params
    params.require(:student).permit(:name)
  end

  def set_student
    @student = Current.school.students.find(params[:id])
  end
end
