require_relative 'document'
require_relative 'shiny_document'
require_relative 'electronic_document'

describe Document do
  before :each do
    @text = 'A bunch of words'
    @doc = Document.new('test', 'nobody', @text)
  end
  it 'should hold on to contents' do
    @doc.contents.should == @text
  end

  it 'should know which words it has' do
    @doc.words.should include('A')
    @doc.words.should include('bunch')
  end

  it 'should have the right number of words' do
    @doc.word_count.should == 4
  end
  it 'should add documents correctly' do
    doc2 = Document.new(@doc.title, @doc.author, 'too much')
    doc3 = @doc + doc2
    doc3.word_count.should == 6
  end

  it 'on initialization it should have times as its font' do
    doc = Document.new(@doc.title, @doc.author, 'too much')
    doc.font.should == :times
    doc.font.should == Document.civ_font
    Document.default_paper_size.should == :a4
  end

  it 'inherited class should have its unique value for class instance var' do
    doc = Document.new(@doc.title, @doc.author, 'too much')
    doc.font.should == :times
    shiny_doc = ShinyDocument.new('','','')
    shiny_doc.font.should == :courier
  end
  it 'should be able to count the number of cliches in text' do
    text = 'play fast and loose make no mistake'
    doc = Document.new('','',text)
    doc.number_of_cliches.should == 2
    edoc = ElectronicDocument.new('','',text)
    edoc.number_of_cliches.should == 2
  end

  it 'its ancestors should include modules as super classes' do
    ancestors = Document.ancestors
    ancestors.include?(WritingQuality).should == true
    ancestors.include?(AnotherModule).should == true
  end
end
