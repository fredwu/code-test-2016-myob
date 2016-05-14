module Plutus
  class Workflow
    def self.run(input_file_path:, output_file_path:)
      employee_data          = Transformer.new(File.new(input_file_path)).employees_data
      employees              = Builder.new(employee_data).employees
      employees_payslip_data = Producer.new(employees).employees_payslip_data

      Presenter.new(employees_payslip_data).write_to(output_file_path)
    end
  end
end
