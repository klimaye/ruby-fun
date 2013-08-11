require_relative 'Document'
require_relative 'String'
describe String do
  it 'should return a document upon addition' do
    doc = Document.new('string','me',' + document')
    str = 'string'
    new_doc = str + doc
    new_doc.contents.should == 'string + document'
    new_doc.title.should == 'string'
  end

  it 'should return string if a document is not added' do
    str = 'string'
    other_str = ' plus string'
    new_str = str + other_str
    new_str.should == 'string plus string'
  end
end
