module Plutus
  class CLI
    class << self
      def options
        @options ||= {}
      end

      def run
        Parser.run
      end
    end
  end
end
