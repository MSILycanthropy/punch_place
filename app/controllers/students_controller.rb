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

    render turbo_stream: turbo_stream.prepend(
      'student-list',
      partial: 'students/form',
      locals: { student: @student }
    )
  end

  def edit; end

  def create # rubocop:disable Metrics/MethodLength
    @student = Current.school.students.new(student_params)

    Current.school.students << @student

    if @student.save
      render turbo_stream: [turbo_stream.remove('new_student'), turbo_stream.append(
        'student-list',
        partial: 'students/student',
        locals: { student: @student }
      )]

      @student.broadcast_append_to('students',
                                   target: 'student-list',
                                   partial: 'students/student')
    else
      render :new, status: :unprocessable_entity
    end
  end

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
