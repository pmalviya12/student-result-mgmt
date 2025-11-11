class Result < ApplicationRecord
   validates :student_name, :subject, :marks, presence: true
end
