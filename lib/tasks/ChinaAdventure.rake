namespace :china do
  desc "Reads a text file and inserts journal entries into the database"
  task :import => :environment do
    require 'date'

    def save_record ( date, content )
      return unless date && content
      obj = ChinaAdventure.where( date: date ).first_or_create
      obj.title   = date.strftime('%B %-d')
      obj.content = content
      obj.save
      puts "Saved #{obj.title}"
    end

    Dir.glob('lib/china/*.txt').sort.each do |file|
      next unless File.readable?(file)

      puts "Parsing #{file}"

      date = nil
      content = String.new

      File.open(file).each do |line|
        if line =~ /\A\s*(june|july|august|september)\s+\d+/i
          # Save the record
          save_record( date, content )

          date = Date.parse("#{line.strip!}, 2012")
          content = String.new
          next
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