class DocumentIdentifier
  attr_reader :folder, :name
  def initialize( folder, name )
    @folder = folder
    @name = name
  end

  def ==(other)
    return true if other.equal?(self)
    return false unless other.kind_of?(self.class)
    puts "about to compare folder and name"
    folder == other.folder && name == other.name
  end 
end
