require_relative 'reader'

describe Reader do
  it 'should know all its descendants ' do
    array = []
    array << XmlReader
    array << JsonReader
    Reader.classes.should == array
  end

  it 'should have the right select options ' do
    options = [['XmlReader', 'XmlReader'], ['JsonReader', 'JsonReader']]
    Reader.select_options.should == options
  end
end
