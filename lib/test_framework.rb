$passed_tests = 0
$failed_tests = 0
$response = []

module Test
  class TestFramework
    @@total_tests = 0
    @@before_eachs = []
    @@after_eachs = []
    @@before_all = []
    @@after_all = []
    class << self
      def before_each(lambda)
        @@before_eachs.append(lambda)
      end

      def after_each(lambda)
        @@after_eachs.append(lambda)
      end

      def before_all(lambda)
        @@before_all.append(lambda)
      end

      def after_all(lambda)
        @@after_all.append(lambda)
      end

      def it(_describe)
        @@total_tests += 1
        @@before_eachs.map(&:call)
        p yield
        @@after_eachs.map(&:call)
      end

      def describe(_describe)
        @@before_all.map(&:call)
        yield
        @@after_all.map(&:call)
      end

      def response
        "#{@@passed_tests}, #{@@failed_tests}, #{@@response}"
      end

      def show_result
        puts "
          TotalTest: #{@@total_tests}
          Test Suites: passed, total
          Tests: #{$passed_tests} passed, #{$total_tests} total
          "
      end
    end
  end
end
