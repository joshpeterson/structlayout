class ValidateInput
  @@relative_include_message = "We can only compute the layout for files with \
system include paths. Not to worry though! You can run layout on your machine. \
Download it <a href=\"https://github.com/joshpeterson/layout\">here</a>."

  @@relative_include_regex = /#include\s*"/
  @@relative_path_in_system_include_regex = /#include\s*<.*\.\./
  @@absolute_path_system_include_regex = %r{#include\s*<.*\/}

  def self.call(input)
    if @@relative_include_regex =~ input ||
       @@relative_path_in_system_include_regex =~ input ||
       @@absolute_path_system_include_regex =~ input
      return Result.failed(@@relative_include_message)
    end

    Result.successful
  end
end
