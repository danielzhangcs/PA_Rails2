class StaticPagesController < ApplicationController
  def home
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
    puts params
    @subject = params[:subject] == nil ? nil : Subject.find_by(subject_id: params[:subject][:id])

    if params[:subject].blank?
      @courses = Course.where("name LIKE ?", "%#{params[:name]}%")
    else
      @courses = Subject.find(params[:subject][:id]).courses.where("name LIKE ?",
                                                              "%#{params[:name]}%")
    end

  end

end
