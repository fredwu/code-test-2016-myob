require 'optparse'

module Plutus
  class CLI
    class Parser
      def self.run
        OptionParser.new do |opts|
          opts.banner = 'Example usage:'

          opts.on('-i', '--input FILE', 'Path to the employees salary input file') do |opt|
            CLI.options[:input_file_path] = opt
          end

          opts.on('-o', '--output FILE', 'Path to the employees payslip output file') do |opt|
            CLI.options[:output_file_path] = opt
          end
        end.parse!
      end
    end
  end
end
