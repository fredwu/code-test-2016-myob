module Plutus
  class Transformer
    attr_reader :employees_data_file

    def initialize(employees_data_file)
      @employees_data_file = employees_data_file
    end

    def employees_data
      CSV.new(employees_data_file).to_a.map do |row|
        {
          first_name:    row[0],
          last_name:     row[1],
          annual_salary: row[2].to_i,
          super_rate:    row[3].to_f,
          month_period:  row[4]
        }
      end
    end
  end
end
