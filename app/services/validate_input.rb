class ValidateInput
  @relative_include_message = "We cannot compute the layout for files with \
relative include paths. Not to worry though! You can use relative include \
paths by running layout on your machine. Download it here: \
https://github.com/joshpeterson/layout"

  def self.call(input)
    return Result.failed(@relative_include_message) if /#include\s*"/ =~ input

    Result.successful
  end
end
