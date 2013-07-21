require_relative 'writing_quality'

class ElectronicDocument
  include WritingQuality

  attr_accessor :title, :author, :contents

  def initialize(title, author, text)
    @title = title
    @author = author
    @contents = text
  end

end
