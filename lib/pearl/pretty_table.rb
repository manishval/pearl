require 'terminal-table'

module Pearl
  module PrettyTable
    def pretty_table(heading, data)
      # Convert JSON response into a hash for easier parsing
      tmp = MultiJson.load(data, symbolize_keys: true)

      # Convert the heading to a symbol and pull the required data
      symbolized_heading = heading.downcase.gsub(/\s+/, "_").to_sym

      if tmp[symbolized_heading].empty?
         puts "No #{heading.downcase} found."
         return
      end

      # Single objects such as a droplet and an image are not enclosed in
      # an array. 
      if tmp[symbolized_heading].is_a?(Hash)
        tmp[symbolized_heading] = [tmp[symbolized_heading]]
      end

      # Build row headings from the hash keys
      row_headings = tmp[symbolized_heading].first.keys

      # Sort images in alphabetical order
      if symbolized_heading == :images
        tmp[symbolized_heading].sort_by! { |h| h[:name] }
      end

      # Loop through each array element and get the values
      rows = []
      tmp[symbolized_heading].each do |row|
        rows << row.values
      end

      table = Terminal::Table.new title: heading, headings: row_headings, rows: rows
      puts table
    end

    # Just for events. Eg. When restarting a droplet
    def pretty_event(heading = '', data)
      # Convert JSON response into a hash for easier parsing
      tmp = MultiJson.load(data, symbolize_keys: true)

      if tmp[:event_id].nil?
         puts "No #{heading.downcase} found."
         return
      end

      rows = []
      rows << [tmp[:status], tmp[:event_id]]

      table = Terminal::Table.new title: heading, headings: ['Status', 'Event ID'], rows: rows
      puts table
    end
  end
end