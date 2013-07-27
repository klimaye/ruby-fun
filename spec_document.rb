require_relative 'document'
require_relative 'shiny_document'
require_relative 'electronic_document'
require_relative 'political_book'
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

  it 'sub class should be able to override a module method' do
    pb = PoliticalBook.new('','','play fast and loose make no mistake')
    pb.number_of_cliches.should == 0
  end

  it 'supports a iterator block for the words in the document' do
    text = 'play fast and loose make no mistake'
    doc = Document.new('','',text)
    word_array = []
    #doc.each_word { |word| word_array.push(word) }
    doc.each do |word| word_array.push(word) end
    word_array.count.should == doc.words.count
    pair_array = []
    doc.each_word_pair do |word1, word2| pair_array.push([word1, word2]) end
    pair_array.count.should == 6
  end

  it 'should execute a block provided to the new (initializer)' do
    text = "play fair"
    doc = Document.new('','','') do |d|
      d.contents = text
    end
    doc.contents.should == text
  end

  it 'should execute the explicit block passed to load' do
    doc = Document.new('','','')
    doc.on_load do |my_doc|
      my_doc.loaded = true
    end
    doc.load
    doc.contents.should == 'LOADED'
    doc.loaded.should == true
  end

  it 'should execute default explicit block' do
    doc = Document.new('','','')
    doc.load
    Document.show_loaded
    doc.show_loaded
    doc.loaded.should == true
  end
end
