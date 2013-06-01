module ZeptoSpec
  class TestCase

    def assert(expression)
      expression
    end

    class << self
      def inherited(child)
        @@test_cases ||= []
        @@test_cases << child
      end

      def run_all
        @@test_cases.each do |test_case|
          test_case.run
        end
      end

      def run
        test_methods = instance_methods(false)
        test_methods.each do |m|
          run_test_method(m.to_s)
        end
      end

      def run_test_method(method_name)
        begin
          result = self.new.instance_eval(method_name)
          puts "#{method_name} - #{result ? 'PASSED' : 'ERROR'}"
        rescue Exception => e
          puts e.message
          puts e.backtrace.inspect
          puts "#{method_name} - FAIL"
        ensure
          # always executed
        end
      end
    end
  end
end
