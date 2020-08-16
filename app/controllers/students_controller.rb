class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy, :mark_attendance_form, :mark_attendance, :show_all_attendance]
  before_action :set_subjects, only: [:mark_attendance_form, :mark_attendance]

  # GET /students
  # GET /students.json
  def index
    if current_user.is_teacher?
      if params.has_key?(:search_student)
        @students = Student.where(roll_number: params[:roll_number], standard_id: params[:standard_id])
      else
        @students = Student.all
      end  
    elsif current_user.is_student?
      @students = Student.where(id: current_user.userable.id)
    end  
  end
  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def mark_attendance_form
  
  end
    def mark_attendance
    @subjects.each do |subject|
      if params[:subject_ids].include?(subject.id.to_s)
        attendance = @student.attendances.where(date: params[:attendance_date]).first_or_initialize
        attendance.status = true
        attendance.subject = subject 
        attendance.save
      else
        attendance = @student.attendances.where(date: params[:attendance_date]).first_or_initialize
        attendance.status = false
        attendance.subject = subject 
        attendance.save
      end
    end
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Attendance Submitted successfully.' }
    end
  end
  def show_all_attendance
    @current_month_attendance = @student.attendances.where("date > ? AND date < ?", Time.now.beginning_of_month, Time.now.end_of_month)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end
    def set_subjects
      @subjects = Subject.where(standard_id: @student.standard_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name, :roll_number, :standard_id)
    end
    def mark_attendance_form
  
  end


end
