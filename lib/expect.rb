module Expect
  def to_be(expected, value)
    if value.eql? expected
      p $response << { name: message(value, expected), status: true }
      $passed_tests += 1
    else
      p $response << { name: message(value, expected), status: false }
      $failed_tests += 1
    end
  end

  private

  def message(value, expect)
    "expect #{value} to have the same object_id as #{expect}"
  end
end
