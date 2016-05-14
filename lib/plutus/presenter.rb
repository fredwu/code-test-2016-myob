module Plutus
  class Presenter
    attr_reader :employees_payslip_data

    def initialize(employees_payslip_data)
      @employees_payslip_data = employees_payslip_data
    end

    def write_to(path)
      CSV.open(path, 'w') do |csv|
        employees_payslip_data.each do |employee_payslip_data|
          csv << employee_payslip_data.values
        end
      end
    end
  end
end
