# frozen_string_literal: true

class FormatError
  def self.call(input)
    %(/*
At least one compilation error occurred while parsing the code:
#{input.strip}
*/

)
  end
end
