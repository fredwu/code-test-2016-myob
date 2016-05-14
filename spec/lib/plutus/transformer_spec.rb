require 'spec_helper'

RSpec.describe Plutus::Transformer do
  subject { described_class.new(File.new('example-data/input.csv')) }

  its(:employees_data) do
    is_expected.to eq(
      [
        {
          first_name:    'David',
          last_name:     'Rudd',
          annual_salary: 60_050,
          super_rate:    9.0,
          month_period:  '01 March - 31 March'
        },
        {
          first_name:    'Ryan',
          last_name:     'Chen',
          annual_salary: 120_000,
          super_rate:    10.0,
          month_period:  '01 March - 31 March'
        }
      ]
    )
  end
end
