require 'spec_helper'

RSpec.describe Plutus::Producer do
  let(:employees) do
    [
      Plutus::Models::Employee.new(
        first_name:    'Jack',
        last_name:     'Barker',
        annual_salary: 220_000,
        super_rate:    9.5,
        month_period:  '01 March - 31 March'
      ),
      Plutus::Models::Employee.new(
        first_name:    'Richard',
        last_name:     'Hendricks',
        annual_salary: 175_000,
        super_rate:    9.5,
        month_period:  '01 March - 31 March'
      )
    ]
  end

  subject { described_class.new(employees) }

  its(:employees_payslip_data) do
    is_expected.to eq(
      [
        {
          name:         'Jack Barker',
          pay_period:   '01 March - 31 March',
          gross_income: 18_333,
          income_tax:   6_046,
          net_income:   12_287,
          super:        1_742
        },
        {
          name:         'Richard Hendricks',
          pay_period:   '01 March - 31 March',
          gross_income: 14_583,
          income_tax:   4_391,
          net_income:   10_192,
          super:        1_385
        }
      ]
    )
  end
end
