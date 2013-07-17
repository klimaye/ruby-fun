require_relative 'document'

describe Document do
  it 'should hold on to contents' do
    text = 'A bunch of words'
    doc = Document.new('test', 'nobody', text)
    doc.contents.should == text
  end
end
