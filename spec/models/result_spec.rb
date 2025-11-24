require 'rails_helper'

RSpec.describe Result, type: :model do
  it "is valid with student_name, subject, and marks" do
    result = Result.new(student_name: "Pragati", subject: "Maths", marks: 90)
    expect(result).to be_valid
  end

  it "is invalid without student_name" do
    result = Result.new(subject: "Maths", marks: 90)
    expect(result).not_to be_valid
  end

  it "is invalid without subject" do
    result = Result.new(student_name: "Pragati", marks: 90)
    expect(result).not_to be_valid
  end

  it "is invalid without marks" do
    result = Result.new(student_name: "Pragati", subject: "Math")
    expect(result).not_to be_valid
  end
end
