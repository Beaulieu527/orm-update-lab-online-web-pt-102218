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

  def self.drop_table
    sql = "DROP TABLE IF EXISTS students"
    DB[:conn].execute(sql)
  end

  def self.create_table
    sql = <<-SQL
    CREATE TABLE IF NOT EXISTS students (
      id INTEGER PRIMARY KEY,
      name TEXT,
      grade TEXT
    )
    SQL

    DB[:conn].execute(sql)
  end

  def self.new_from_db(row)
   new_student = self.new  # self.new is the same as running Student.new
   new_student.id = row[0]
   new_student.name =  row[1]
   new_student.grade = row[2]
   new_student  # return the newly created instance
  end

  def self.find_by_name(name)
    sql = <<-SQL
      SELECT *
      FROM students
      WHERE name = ?
      LIMIT 1
    SQL

    DB[:conn].execute(sql, name).map do |row|
      self.new_from_db(row)
    end.first
  end

  def update
  end

  def save
    sql = <<-SQL
      INSERT INTO students (id,name, grade)
      VALUES (?, ?, ?)
    SQL

    DB[:conn].execute(sql, @id, @name, @grade)
  end

end
