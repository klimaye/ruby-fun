class Document
	
  attr_accessor :title, :author, :contents

  def initialize(title, author, contents)
    @title = title
    @author = author
    @contents = contents
  end

  def words
   @contents.split(' ')
  end

  def word_count
    words.size
  end

  def +(other)
    return Document.new(@title, @author, "#{@contents} #{other.contents}")
  end
end
