require_relative 'document'
require_relative 'document_wrapper'

describe DocumentWrapper  do
	before :each do
    	@text = 'A bunch of words'
    	@doc = Document.new('test', 'nobody', @text)
    	@wrapper = DocumentWrapper.new(@doc)
  	end
  	it 'should expose methods from document' do
  		@wrapper.word_count.should == @doc.word_count
  		@wrapper.load
  		@wrapper.loaded.should == true
  		@wrapper.title.should == 'test'
  	end	
end
