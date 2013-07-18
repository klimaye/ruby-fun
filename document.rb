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

  def +(other_contents)
    return Document.new(@title, @author, "#{@contents} #{other_contents}")
  end
end
