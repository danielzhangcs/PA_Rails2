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

Course.delete_all
Instructor.delete_all
Subject.delete_all

courseJson.each do |course|
    Course.create(
        code: course["code"],
        description: course["description"],
        name: course["name"],
        independent_study: course["independent_study"]
    )
end

instructorJson.each do |instructor|
    Instructor.create(
        first: instructor["first"],
        middle: instructor["middle"],
        last: instructor["last"],
        id: instructor["id"],
        email:  instructor["email"]

    )
end

subjectJson.each do |subject|
    Subject.create(
        abbreviation: subject["abbreviation"],
        id: subject["id"],
        name: subject["name"]
    )
end



