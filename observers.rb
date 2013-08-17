module Subject

  def initialize
    @observers = []
  end

  def notify_observers
    @observers.each do |ob|
      ob.update(self)
    end
  end

  def add_observer(new_ob)
    @observers << new_ob
  end

  def delete_observer(ob)
    @observers.delete(ob)
  end
end

class Employee
  include Subject
  attr_accessor :name, :title, :salary

  def initialize(name, title, salary)
    super()
    @name = name
    @title = title
    @salary = salary
  end

  def salary=(new_salary)
    @salary = new_salary
    notify_observers
  end
end

class Payroll
  def update( changed_employee )
    puts("Cut a new check for #{changed_employee.name}!")
    puts("His salary is now #{changed_employee.salary}!")
  end
end

class Taxman
  def update(changed_employee)
     puts("Send #{changed_employee.name} a new tax bill!")
  end
end
fred = Employee.new('Fred', 'Crane Operator', 30000.0)

payroll = Payroll.new
fred.add_observer( payroll )

taxman =  Taxman.new
fred.add_observer(taxman)

fred.salary=35000.0
