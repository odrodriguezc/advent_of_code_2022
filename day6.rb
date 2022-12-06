require 'set'

class Reader
  attr_reader :content
  attr_accessor :path

  def initialize(filepath = nil)
    @path = filepath
  end

  def read
    @content = File.read(@path)
  end

  def readlines(args)
    @content = File.readlines(@path, *args)
  end
end

class Resolver
  def self.resolve(input, serie_length = 4)
    find_first_different_serie(input, serie_length)
  end

  def self.find_first_different_serie(dataset, serie_length)
    count = 0
    count += 1 until chars_different?(dataset[0 + count..(serie_length - 1) + count])

    count + serie_length
  end

  def self.chars_different?(chars)
    chars.chars.uniq.size == chars.size
  end
end


pp "Part 1 => #{Resolver.resolve(Reader.new('./day6input.txt').read)}"
pp "Part 2 => #{Resolver.resolve(Reader.new('./day6input.txt').read, 14)}"
