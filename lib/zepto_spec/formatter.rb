module ZeptoSpec
  class Formatter

    def output(source)
      puts source
    end

    def summary(statistic)
      passed_count = statistic[:passed].size
      failed_count = statistic[:fail].size
      error_count = statistic[:error].size
      all_tests_count = passed_count + failed_count + error_count

      output "---SUMMARY:---"
      output "PASSED: #{passed_count}, ERRORS: #{error_count}, FAILED: #{failed_count} from #{all_tests_count} tests"
    end 

    def show_result(result)
      output "#{result[:test_name]} #{result[:status]} #{result[:message]} #{result[:backtrace]}"
    end

  end
end
