module Expect
  @@passed_tests = 0
  @@failed_tests = 0
  @@response = []
  def to_be(expected, value)
    if value.eql? expected
      @@response << { name: message(value, expected), status: true }
      @@passed_tests += 1
    else
      @@response << { name: message(value, expected), status: false }
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
