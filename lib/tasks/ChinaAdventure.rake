namespace :china do
  desc "Imports text files into the China Journal database"
  task :import => :environment do
    require 'date'

    def save_record ( date, content )
      return unless date && content

      if ( obj = ChinaAdventure.where( date: date ).first )
        unless ( obj.content.encode == content.encode )
          print "Saving changes for #{obj.title}... "
          obj.content = content
          obj.save
          puts "OKAY"
        end
      else
        ChinaAdventure.create( date: date, 
                               title: date.strftime('%B %-d'),
                               content: content
                             )
        puts "Created new object for #{date}"
      end
    end

    Dir.glob('lib/china/*.txt').sort.each do |file|
      next unless File.readable?(file)

      puts "Parsing #{file}"

      date = nil
      content = String.new

      File.open(file).each do |line|
        if line =~ /\A\s*(june|july|august|september)\s+\d+/i
          # Save the previous record first
          save_record( date, content )

          date = Date.parse("#{line.strip!}, 2012")
          content = String.new

          next # to the next record
        end

        if /\<IMG:/ =~ line
          line.gsub!(/\<IMG:(\d+):([LR])\>/,
                     "<img src='/assets/china/#{date.strftime('%Y%m%d')}\\1.jpg' class='float-\\2 zoom'>")
        end

        content += "<p>#{line}</p>" unless line.strip.empty?
      end

      # Save the last record
      save_record( date, content )
    end
  end
end
