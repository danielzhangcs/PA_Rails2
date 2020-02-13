class ApplicationController < ActionController::Base
    def home
        @courses=Course.all
        @instructors=Instructor.all
        @subjects=Subject.all
        render './home'
      end
end
