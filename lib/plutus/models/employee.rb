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

      def full_name
        "#{first_name} #{last_name}"
      end

      def gross_income
        (annual_salary.to_f / 12).round
      end

      def income_tax
        ((fully_taxable_brackets_amount + partially_taxable_bracket_amount).to_f / 12).round
      end

      def net_income
        gross_income - income_tax
      end

      def super
        (gross_income.to_f * super_rate / 100).round
      end

      private

      def tax_rate
        TAX_RATES.select { |tax_rate| tax_rate.include?(annual_salary) }
      end

      def fully_taxable_brackets_amount
        tax_rate.values[0][:base_tax_amount]
      end

      def partially_taxable_bracket_start
        tax_rate.keys[0].first - 1
      end

      def partially_taxable_bracket_tax_rate
        tax_rate.values[0][:tax_rate]
      end

      def partially_taxable_bracket_amount
        (annual_salary - partially_taxable_bracket_start) * partially_taxable_bracket_tax_rate
      end
    end
  end
end
