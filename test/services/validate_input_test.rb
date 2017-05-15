require 'test_helper'

class ValidateInputTest < MiniTest::Test
  @@relative_path_message = "We can only compute the layout for files with system \
include paths. Not to worry though! You can run layout on your machine. Download \
it <a href=\"https://github.com/joshpeterson/layout\">here</a>."
  @@test_data = [{ input: 'struct Test { int i; };',
                   result: true },
                 { input: '#include  "foo.h" struct Test { int i; };',
                   result: false, error_message: @@relative_path_message },
                 { input: '#include <path/../foo.h> struct Test { int i; };',
                   result: false, error_message: @@relative_path_message },
                 { input: '#include </path/to/foo.h> struct Test { int i; };',
                   result: false, error_message: @@relative_path_message }]

  def test_validation_of_input
    @@test_data.each { |data| validate_input(data) }
  end

  def validate_input(data)
    result = ValidateInput.call(data[:input])
    assert_equal(data[:result], result.success,
                 "The input '#{data[:input]}' validated, which is not expected.")

    return if data[:error_message].nil?

    assert_equal(data[:error_message], result.message,
                 "The error message for input '#{data[:input]}' is not correct.")
  end
end
