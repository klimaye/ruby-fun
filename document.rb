require_relative 'writing_quality'
class Document

  include WritingQuality
  include AnotherModule
  #class variable (try not to use ever
  @@default_paper_size = :a4

  #generate singleton methods on class object
  def self.default_paper_size
    @@default_paper_size
  end

  #singleton method on class object aka 'Document'
  def self.default_paper_size=(new_size)
    @@default_paper_size = new_size
  end

  #class instance variable
  @civ_font = :times
  class << self
    #create singleton methods
    attr_accessor :civ_font
  end

  #instance variables
  attr_accessor :title, :author, :contents

  #instance variable
  attr_accessor :paper_size, :font

  def initialize(title, author, contents)
    @title = title
    @author = author
    @contents = contents
    @paper_size = @@default_paper_size
    @font = Document.civ_font
  end

  def words
   @contents.split(' ')
  end

  def word_count
    words.size
  end

  def each
    words.each { |word| yield(word) }
  end

  def each_word_pair
    words_array = words
    index = 0;
    while index < words_array.size - 1
      yield words_array[index], words_array[index + 1]
      index += 1
    end
  end

  def +(other)
    return Document.new(@title, @author, "#{@contents} #{other.contents}")
  end
end
