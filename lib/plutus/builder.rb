module Plutus
  class Builder
    attr_reader :employees_data

    def initialize(employees_data)
      @employees_data = employees_data
    end

    def employees
      employees_data.map do |employee_data|
        Models::Employee.new(**employee_data)
      end
    end
  end
end
