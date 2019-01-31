require_relative "../config/environment.rb"

class Student
  attr_reader :id
  attr_accessor :name, :grade
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
  def initialize(id: nil, name:, grade:)
    self.id = id
    self.name = name
    self.grade = grade
  end

end
