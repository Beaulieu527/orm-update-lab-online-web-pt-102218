require_relative "../config/environment.rb"

class Student
  attr_reader :id
  attr_accessor :name, :grade
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
  def initialize(id = nil, name, grade)
    @id = id
    @name = name
    @grade = grade
  end

  def self.create_table
  end

  def self.drop_table
  end

  def self.create_table
  end

  def self.new_from_db
  end

  def self.find_by_name
  end

  def update
  end

  def saves

    sql = <<-SQL
      INSERT INTO students (name, grade)
      VALUES (?, ?)
    SQL

    DB[:conn].execute(sql, self.name, self.grade)
  end
  end

end
