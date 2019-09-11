class Employee
  attr_reader :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end

end

class Manager < Employee
  def initialize(name, salary, boss, *employees)
    @name = name
    @salary = salary
    @boss = boss
    @title = 'manager'
    @subordinates = employees
    
  end
  
  def bonus(multiplier)
    total_bonus = 0
    employees_queue = []
    @subordinates.each do |employee|
      employees_queue << employee
    end
      until employees_queue.empty?
        employee = employees_queue.shift
        total_bonus += employee.salary
        if employee.subordinates
          employees_queue << employee.subordinates
        end
      end
      total_bonus * multiplier
  end

end