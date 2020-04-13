# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "json"

courseJson = JSON.parse(File.open("./db/pa_rails_json/course.json").read)
subjectJson = JSON.parse(File.open("./db/pa_rails_json/subject.json").read)
instructorJson = JSON.parse(File.open("./db/pa_rails_json/instructor.json").read)

courses = []
instructors = []
subjects = []
course_subjects = []

Course.delete_all
Instructor.delete_all
Subject.delete_all

courseJson.each do |course|
    courses<<Course.new(
        code: course["code"],
        description: course["description"],
        name: course["name"],
        independent_study: course["independent_study"]
    )

    course["subjects"].each do |subject|
        course_subjects<<CourseSubject.new(
            course_code: course["code"],
            subject_id: subject["id"]
        )
    end
end

instructorJson.each do |instructor|
    instructors<<Instructor.new(
        first: instructor["first"],
        middle: instructor["middle"],
        last: instructor["last"],
        id: instructor["id"],
        email:  instructor["email"]

    )
end

subjectJson.each do |subject|
    subjects<<Subject.new(
        abbreviation: subject["abbreviation"],
        id: subject["id"],
        name: subject["name"]
    )
end



Course.import courses
Instructor.import instructors
Subject.import subjects
CourseSubject.import course_subjects



User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(name:  name,
                 email: email,
                 password:              password,
                 password_confirmation: password,
                 activated: true,
                 activated_at: Time.zone.now)
end