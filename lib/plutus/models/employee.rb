module Plutus
  module Models
    class Employee
      attr_reader :first_name, :last_name, :annual_salary, :super_rate, :month_period

      def initialize(first_name:, last_name:, annual_salary:, super_rate:, month_period:)
        @first_name    = first_name
        @last_name     = last_name
        @annual_salary = annual_salary
        @super_rate    = super_rate
        @month_period  = month_period
      end
    end
  end
end
