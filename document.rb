require_relative 'writing_quality'
class Document

  #this class level method will create a reader and writer akin to attr_accessor
  def self.simple_attr_accessor(name)
    writer_method_name = "#{name}="
    reader_code = "def #{name}; @#{name}; end"
    class_eval(reader_code)
    define_method(writer_method_name) do |value|
      var_name = "@#{name}"
      instance_variable_set(var_name, value)
    end
  end

  def self.reload
    remove_instance_methods
    load(__FILE__)
  end

  def self.remove_instance_methods
    instance_methods(false).each do |method|
      remove_method(method)
    end
  end

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
  #anything defined with @ outside of any instance methods becomes class var
  @civ_font = :times
  class << self
    #create singleton methods
    attr_accessor :civ_font
  end

  #instance variables
  attr_accessor :title, :author, :contents

  #instance variable
  attr_accessor :paper_size, :font, :loaded

  def on_load(&block)
    #anything defined with @ in an instance method becomes instance var
    @load_listener = block
  end

  # #this is great to log or do something with the passed in doc
  # #but to manipulate anything instance level, we need a
  # #instance level lambda
  # DEFAULT_CLASS_LEVEL_LOAD_LISTENER = lambda do |doc|
  #   puts "inside default load listener"
  #   @loaded = true
  #   puts "@loaded = #{@loaded}!"
  # end

  def self.show_loaded
    puts "class level @loaded = #{@loaded}"
  end

  def show_loaded
    puts "instance level @loaded = #{@loaded}"
  end

  def method_missing(method_name, *args)
    msg = "#{method_name} method not found"
    raise msg
  end

  def initialize(title, author, contents)
    @title = title
    @author = author
    @contents = contents
    @paper_size = @@default_paper_size
    @font = Document.civ_font
    @loaded = false
    @load_listener = lambda do |doc|
      puts "inside instance default load listener"
      @loaded = true
      puts "@loaded = #{@loaded}!"
    end
    yield (self) if block_given?
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

  def load
    @contents = 'LOADED'
    @load_listener.call(self) if @load_listener
  end
end
