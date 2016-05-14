module Plutus
  class Producer
    attr_reader :employees

    def initialize(employees)
      @employees = employees
    end

    def employees_payslip_data
      employees.map do |employee|
        {
          name:         employee.full_name,
          pay_period:   employee.month_period,
          gross_income: employee.gross_income,
          income_tax:   employee.income_tax,
          net_income:   employee.net_income,
          super:        employee.super
        }
      end
    end
  end
end
