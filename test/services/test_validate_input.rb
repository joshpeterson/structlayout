require 'test_helper'

class ValidateInputTest < MiniTest::Test
  def test_validation_of_input
    test_data = [{ input: 'struct Test { int i; };',
                   result: true },
                 { input: '#include  "foo.h" struct Test { int i; };',
                   result: false, error_message: "We cannot compute the layout \
for files with relative include paths. Not to worry though! You can use relative \
include paths by running layout on your machine. Download it here: \
https://github.com/joshpeterson/layout"}]

    test_data.each { |data| validate_input(data) }
  end

  def validate_input(data)
    result = ValidateInput.call(data[:input])
    assert_equal(data[:result], result.success)

    return if data[:error_message].nil?

    assert_equal(data[:error_message], result.message)
  end
end
