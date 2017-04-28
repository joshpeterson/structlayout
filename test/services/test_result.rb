require 'test_helper'

class ResultTest < MiniTest::Test
  def test_create_successfull_result
    result = Result.successful
    assert(result.success)
  end

  def test_create_failed_result
    result = Result.failed('unused')
    assert(!result.success)
  end

  def test_create_failed_result_with_message
    expected_message = 'expected failure message'
    result = Result.failed(expected_message)
    assert_equal(expected_message, result.message)
  end
end
