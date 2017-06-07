class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user
  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
    render :partial => 'course', :object => @course
  end
  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create #Used to create courses
    begin
    @course = Course.new(course_params)

      if @course.save
        redirect_to courses_path
      end
    rescue exc
         logger.error("Message for the log file #{exc.message}")
         flash[:notice] = "Application error message"
         raise exc
  end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update #Updates course data
    begin

    @course = Course.find(params[:id])

    if @course.update_attributes(course_params)
     redirect_to courses_path, :id => @course
    end
  rescue exc
       logger.error("Message for the log file #{exc.message}")
       flash[:notice] = "Application error message"
       raise exc
end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json

  def destroy #Destroys course data
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :description, :date_started, :date_ended )
    end
end
