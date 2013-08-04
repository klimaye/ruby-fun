class Reader
  @classes = []
  class << self
    attr_accessor :classes
  end

  def self.inherited(subclass)
    Reader.classes << subclass
  end

  def self.select_options
    Reader.classes.map { |c| [c.to_s, c.to_s] }
  end
end

class XmlReader < Reader
end

class JsonReader < Reader
end
