require 'spec_helper'

RSpec.describe Plutus::Presenter do
  let(:employees_payslip_data) do
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
  end

  subject { described_class.new(employees_payslip_data) }

  it '#write_to' do
    file_path = "#{Dir.pwd}/spec/tmp/presenter_write_to.csv"

    subject.write_to(file_path)

    expect(CSV.read(file_path, 'r')).to eq(
      [
        ['Jack Barker', '01 March - 31 March', '18333', '6046', '12287', '1742'],
        ['Richard Hendricks', '01 March - 31 March', '14583', '4391', '10192', '1385']
      ]
    )
  end
end
