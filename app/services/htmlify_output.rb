class HtmlifyOutput
  def self.call(input)
    # output = input.gsub('<', '&lt;').gsub('>', '&gt;')
    highlight(input)
  end

  def self.highlight(source)
    formatter = Rouge::Formatters::HTML.new
    lexer = Rouge::Lexers::C.new
    formatter.format(lexer.lex(source))
  end
end
