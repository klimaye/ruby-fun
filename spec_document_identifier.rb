require_relative 'document_identifier.rb'

describe DocumentIdentifier do

  it 'should be == to an identifier with same data' do

    id1 = DocumentIdentifier.new('test','blah')
    id2 = DocumentIdentifier.new('test','blah')
    id1.should == id2
  end

end
