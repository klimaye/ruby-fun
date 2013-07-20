class ShinyDocument < Document

  @civ_font = :courier
  class << self
    attr_accessor :civ_font
  end

  def initialize(title, author, contents)
    @title = title
    @author = author
    @contents = contents
    @font = ShinyDocument.civ_font
  end
end
