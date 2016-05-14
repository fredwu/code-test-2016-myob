require 'spec_helper'

RSpec.describe Plutus::Workflow do
  it '.run' do
    tmp_file = "#{Dir.pwd}/spec/tmp/workflow_run.csv"

    described_class.run(
      input_file_path:  File.new('example-data/input.csv'),
      output_file_path: tmp_file
    )

    expect(CSV.read(tmp_file, 'r')).to eq(CSV.read('example-data/output.csv', 'r'))
  end
end
