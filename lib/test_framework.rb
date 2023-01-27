class TestFramework
  @@total_tests = 0
  @@before_eachs = []
  @@after_eachs = []
  @@before_all = []
  @@after_all = []
  @@passed_tests = 0
  @@failed_tests = 0
  @@response = []
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

    def to_be(expected, value)
      if value.eql? expected
        p @@response << { name: message(value, expected), status: true }
        @@passed_tests += 1
      else
        p @@response << { name: message(value, expected), status: false }
        @@failed_tests += 1
      end
    end

    def response
      "#{@@passed_tests}, #{@@failed_tests}, #{@@response}"
    end

    private

    def message(value, expect)
      "expect #{value} to have the same object_id as #{expect}"
    end
  end
end
