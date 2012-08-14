#!/usr/bin/env ruby

require 'rubygems'
require 'fileutils'
require 'date'

##
## Constants / Globals
##

# Defaults for options
defaults = {
  'source' => [ "." ],
  'dest'   => ".",
  'days'   => 30,
}

Version = "1.0.0"
Ident   = "Journal2txt"
Author  = "Donovan C. Young"
Vstring = "#{Ident} v.#{Version} - #{Author}"

##
## Functions
##

# Display version string and exit
def version
  puts Vstring
  exit( -1 )
end

# Display help/usage information and exit
def usage
  print <<-EoT

#{Vstring}

Usage: #{$0} <file>

  EoT
  exit( -1 )
end

ARGV.each do |file|
  if File.readable?(file)

    puts "Parsing #{file}"
    dateFile = String.new

    File.open(file).each do |line|

      if line =~ /^\s*(june|july|august|september)\s+\d+\s*$/i
        filedate = Date.parse("#{line.strip!}, 2012").strftime('%Y%m%d')

        puts "Opening #{line} as #{filedate}.txt"

        dateFile.close if dateFile.respond_to?(:close)
        dateFile = File.new(filedate, 'w')
        next # Skip to the next line
      end

      # Make sure the file is open
      if dateFile.respond_to?(:print)
        dateFile.print line unless line.empty?
      else
        puts "Whoops... the following line is orphaned (no file to write to)"
        print line
      end

    end

  else
    puts "#{file} does not exist or is not readable to us."
  end
end

