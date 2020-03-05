class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [:show, :edit, :update, :destroy]
  include SessionsHelper

  # GET /enrollments
  # GET /enrollments.json
  def index
    @enrollments = Enrollment.all
  end

  # GET /enrollments/1
  # GET /enrollments/1.json
  def show
  end

  # GET /enrollments/new
  def new
    @enrollment = Enrollment.new
  end

  # GET /enrollments/1/edit
  def edit
  end

  # POST /enrollments
  # POST /enrollments.json
  def create
    course = Course.find_by(code: params[:code])
    enrollment = Enrollment.new(user_id: current_user.id,
                                course_code: course.code)

    if enrollment.save
      flash.now[:success] = "You've enrolled #{course.code} successfully"
    else
      flash.now[:danger] = "You already enrolled this class!"
    end
    @courses=Course.all
    render 'static_pages/search'
  end

  # PATCH/PUT /enrollments/1
  # PATCH/PUT /enrollments/1.json
  def update
    respond_to do |format|
      if @enrollment.update(enrollment_params)
        format.html { redirect_to @enrollment, notice: 'Enrollment was successfully updated.' }
        format.json { render :show, status: :ok, location: @enrollment }
      else
        format.html { render :edit }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrollments/1
  # DELETE /enrollments/1.json
  def destroy
    @enrollment.destroy
    respond_to do |format|
      format.html { redirect_to enrollments_url, notice: 'Enrollment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_enrollment
    user = User.find(current_user.id)
    enrollment = Enrollment.find_by(course_code: params[:code], user_id: user.id)

    if enrollment.destroy
      flash[:success] = "You've dropped #{params[:code]} successfully"
    else
      flash[:success] = "Drop failed!"
    end
    redirect_to current_user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enrollment_params
      params.require(:enrollment).permit(:user_id, :course_code)
    end
end
