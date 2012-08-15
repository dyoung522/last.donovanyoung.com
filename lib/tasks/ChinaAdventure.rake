namespace :china do
  desc "Reads a text file and inserts journal entries into the database"
  task :journal2db => :environment do
    require 'date'

    unless ARGV[1]
      puts "Usage: rake #{ARGV[0]} <files>"
      exit
    end

    # Shift off program name
    ARGV.shift

    ARGV.each do |file|
      unless File.readable?(file)
        puts "#{file} does not exist or is not readable to us."
        next
      end

      date = nil
      title, content = String.new

      puts "Parsing #{file}"

      File.open(file).each do |line|
        content = String.new unless content

        if line =~ /^\s*(june|july|august|september)\s+\d+\s*$/i
          # Save the record
          ChinaAdventure.create( date: date, title: title, content: content ) if (date && content)
          date = Date.parse("#{line.strip!}, 2012")
          title = date.strftime('%B %-d')
          content = String.new
          next
        end

        if line =~ /\<IMG:/
          content += line.gsub( /\<IMG:(\d+):([LR])\>/,
                                "<img src='/assets/china/#{date.strftime('%Y%m%d')}\\1.jpg' class='float-\\2'>") if date
          next
        end

        content += "<p>#{line}</p>" unless line.strip.empty?

      end

      # Save the last record
      ChinaAdventure.create( date: date, title: title, content: content ) if (date && content)
    end
  end
end