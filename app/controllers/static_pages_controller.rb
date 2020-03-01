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
end
