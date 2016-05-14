require 'spec_helper'

RSpec.describe Plutus::Builder do
  let(:employee_data) do
    [
      {
        first_name:    'Bertram',
        last_name:     'Gilfoyle',
        annual_salary: 130_000,
        super_rate:    9.5,
        month_period:  '01 March - 31 March'
      },
      {
        first_name:    'Dinesh',
        last_name:     'Chugtai',
        annual_salary: 110_000,
        super_rate:    9.5,
        month_period:  '01 March - 31 March'
      }
    ]
  end

  subject(:builder) { described_class.new(employee_data) }

  its(:employees) { is_expected.to have(2).items }

  describe 'an employee' do
    subject { builder.employees.first }

    it { is_expected.to be_kind_of(Plutus::Models::Employee) }

    its(:first_name)    { is_expected.to eq('Bertram') }
    its(:last_name)     { is_expected.to eq('Gilfoyle') }
    its(:annual_salary) { is_expected.to eq(130_000) }
    its(:super_rate)    { is_expected.to eq(9.5) }
    its(:month_period)  { is_expected.to eq('01 March - 31 March') }
  end
end
