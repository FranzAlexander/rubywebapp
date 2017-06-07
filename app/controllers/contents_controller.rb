class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user
  # GET /contents
  # GET /contents.json
  def index #Method displays the contents that belong to the course's id.
    begin

    if params[:id]
      @contents = Content.where('course_id = ?', params[:id])
    else
      @contents = Content.all
    end
  rescue exc
       logger.error("Message for the log file #{exc.message}")
       flash[:notice] = "Application error message"
       raise exc
end
  end

  # GET /contents/1
  # GET /contents/1.json
  def show
  end

  # GET /contents/new
  def new #Creates the content but for that course.
    @content = Content.new
    @content.course_id = params[:id]
  end

  # GET /contents/1/edit
  def edit
    @content = Content.find(params[:id])
  end

  # POST /contents
  # POST /contents.json
  def create
    begin
    @content = Content.new(content_params)

    if @content.save
      redirect_to courses_path
    end
    rescue exc
         logger.error("Message for the log file #{exc.message}")
         flash[:notice] = "Application error message"
          raise exc
  end
  end

  # PATCH/PUT /contents/1
  # PATCH/PUT /contents/1.json
  def update
    begin
      @content = Content.find(params[:id])
      if @content.update_attributes(content_params)
        redirect_to contents_path, :id => @content
      end
    rescue exc
         logger.error("Message for the log file #{exc.message}")
         flash[:notice] = "Application error message"
         raise exc
  end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to contents_url, notice: 'Content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
        @content = Content.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_params
      params.require(:content).permit(:course_id, :lesson_number, :lesson_description, :class_room, :lesson_teacher)
    end
end
