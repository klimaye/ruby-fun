class Document
	
  attr_accessor :title, :author, :contents

  def initialize(title, author, contents)
    @title = title
    @author = author
    @contents = contents
  end

end
