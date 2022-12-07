require 'ostruct'

class Reader
  attr_reader :content
  attr_accessor :path

  def initialize(filepath = nil)
    @path = filepath
  end

  def read
    @content = File.read(@path)
  end

  def readlines(chomp = true)
    @content = File.readlines(@path, chomp: chomp)
  end
end

class Parser
	def self.parse(lines)
		tree = {}
		current_path = ['/']
		last_command = nil
		lines.each_with_index do  |line, i|
			if line.start_with?('$') # command
				entry = line.split(' ')
				command = OpenStruct.new({cmd: entry[1], arg: entry[2]})
				last_command = command

				case command.cmd
				when 'cd'
					if command.arg == '/'
						current_path = ['/']
					elsif command.arg == '..'
						current_path.pop
					else
						current_path << command.arg
					end
				when 'ls'
				end
				pp current_path
			else # last command result
			end
		end
	end
end

filesystem_tree = Parser.parse(Reader.new('./day7input.txt').readlines)

# pp "Part 1 => #{Resolver.resolve()}"
