require_relative 'Document'
class String
  alias_method :old_addition, :+
  def +(other)
    if other.kind_of? Document
      new_content = self + other.contents
      return Document.new(other.title, other.author, new_content)
    end
    old_addition(other)
  end
end
