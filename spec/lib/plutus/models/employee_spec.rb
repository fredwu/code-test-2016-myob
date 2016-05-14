require 'spec_helper'

RSpec.describe Plutus::Models::Employee do
  subject { described_class.new(employee_data) }

  describe 'an example employee' do
    let(:employee_data) do
      {
        first_name:    'David',
        last_name:     'Rudd',
        annual_salary: 60_050,
        super_rate:    9,
        month_period:  'March'
      }
    end

    its(:gross_income)                       { is_expected.to eq(5_004) }
    its(:income_tax)                         { is_expected.to eq(922) }
    its(:net_income)                         { is_expected.to eq(4_082) }
    its(:super)                              { is_expected.to eq(450) }

    its(:tax_rate)                           { is_expected.to eq((37_001..80_000) => { base_tax_amount:  3_572, tax_rate: 0.325 }) }
    its(:fully_taxable_brackets_amount)      { is_expected.to eq(3_572) }
    its(:partially_taxable_bracket_start)    { is_expected.to eq(37_000) }
    its(:partially_taxable_bracket_tax_rate) { is_expected.to eq(0.325) }
    its(:partially_taxable_bracket_amount)   { is_expected.to eq(7_491.25) }
  end

  describe 'the CEO ;)' do
    let(:employee_data) do
      {
        first_name:    'Jack',
        last_name:     'Barker',
        annual_salary: 220_000,
        super_rate:    9.5,
        month_period:  'March'
      }
    end

    its(:gross_income) { is_expected.to eq(18_333) }
    its(:income_tax)   { is_expected.to eq(6_046) }
    its(:net_income)   { is_expected.to eq(12_287) }
    its(:super)        { is_expected.to eq(1_742) }
  end

  describe 'the CTO ;)' do
    let(:employee_data) do
      {
        first_name:    'Richard',
        last_name:     'Hendricks',
        annual_salary: 175_000,
        super_rate:    9.5,
        month_period:  'March'
      }
    end

    its(:gross_income) { is_expected.to eq(14_583) }
    its(:income_tax)   { is_expected.to eq(4_391) }
    its(:net_income)   { is_expected.to eq(10_192) }
    its(:super)        { is_expected.to eq(1_385) }
  end

  describe 'the not-very-well-paid programmer ;)' do
    let(:employee_data) do
      {
        first_name:    'Carla',
        last_name:     'Walton',
        annual_salary: 18_000,
        super_rate:    9.5,
        month_period:  'March'
      }
    end

    its(:gross_income) { is_expected.to eq(1_500) }
    its(:income_tax)   { is_expected.to eq(0) }
    its(:net_income)   { is_expected.to eq(1_500) }
    its(:super)        { is_expected.to eq(143) }
  end
end
