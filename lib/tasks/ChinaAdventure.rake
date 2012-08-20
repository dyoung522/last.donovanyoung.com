namespace :china do
  desc "Reads a text file and inserts journal entries into the database"
  task :import => :environment do
    require 'date'

    def save_record ( date, content )
      return unless date && content
      obj = ChinaAdventure.find_by_date( date )
      obj.destroy unless obj.nil?
      ChinaAdventure.create( date: date, title: date.strftime('%B %-d'), content: content )
    end

    Dir.glob('lib/china/*.txt').sort.each do |file|
      next unless File.readable?(file)

      puts "Parsing #{file}"

      date = nil
      content = String.new

      File.open(file).each do |line|
        if line =~ /^\s*(june|july|august|september)\s+\d+\s*$/i
          # Save the record
          save_record( date, content )

          date = Date.parse("#{line.strip!}, 2012")
          content = String.new
          next
        end

        line.gsub!( /\<IMG:(\d+):([LR])\>/,
                    "<img src='/assets/china/#{date.strftime('%Y%m%d')}\\1.jpg' class='float-\\2'>") if /\<IMG:/ =~ line

        content += "<p>#{line}</p>" unless line.strip.empty?
      end

      # Save the last record
      save_record( date, content )
    end
  end
end