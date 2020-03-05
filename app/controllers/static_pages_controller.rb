class StaticPagesController < ApplicationController
  include SessionsHelper
  def home
    redirect_to user_path(current_user)
  end

  def index
    @courses=Course.all
    @instructors=Instructor.all
    @subjects=Subject.all
  end

  def help
  end

  def about
  end

  def contact
  end

  def search
    @subject = params[:subject] == nil ? nil : Subject.find_by(subject_id: params[:subject][:id])

    if params[:subject] == nil && (params[:name] == nil || params[:name].length == 0)
      @courses = Course.all
    elsif params[:name].length == 0
      @courses = Subject.find(params[:subject][:id]).courses
    else
      @courses = Subject.find(params[:subject][:id]).courses.where("name ILIKE ?",
                                                                   "%#{params[:name].downcase}%")
    end

  end

end
