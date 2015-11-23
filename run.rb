require 'open-uri'
require 'json'
require 'net/sftp'

class Dtcc
  def initialize
    @directories = { 'outstanding' => 'data/outstanding/*',
                     'completed'    => 'data/completed/*' }
  end

  def run
    results = []

    file_names = Dir[@directories['outstanding']]

    file_names.each do |file_name|
      file_contents = open(file_name).read

      @types = {
        'pov' => {
          'type' => '13'
        },
        'far' => {
          'type' => '43'
        }
      }

      lines = parse_file(file_contents)

      if lines[:data]
        data = make_data_rubyish(lines[:data], file_name)

	File.open(file_name + '.' + lines[:file_type].to_s  + '.json', 'w+') do |file|
	  file.puts data.to_json
	end
      end
    end
  end

  def make_data_rubyish(lines, file_name)
    keys = lines.keys
    grouped = {}
    array = []

    keys.each do |key|
      split = key.split('-')

      lines[key]['Received Date'] = @received_date

      if !grouped.keys.include?(lines[key]['Contract Number'])
        grouped[lines[key]['Contract Number']] = {}
        grouped[lines[key]['Contract Number']][split[0]] = lines[key]
      else
        grouped[lines[key]['Contract Number']][split[0]] = lines[key]
      end
    end

    grouped.keys.each do |key|
      array.push(grouped[key])
    end

    array
  end

  def parse_far(file_contents)
    rows = file_contents.split("\n")

    lines = {}

    counter = 1

    rows.each do |row|
      if counter == 1
        @received_date = row[6, 8]
        counter += 1
      end

      type = row[1, 2]

      if type == '43'
        sequence = row[3, 2]
        selector = type.to_s + '' + sequence.to_s
        entity_name = 0

        if selector == '4309'
          name_type = row[175, 1]

          if name_type == 'X'
            entity_name = 1
          end
        end

        spacing = format_spacing(selector, entity_name, 'far')
        line = parse_line(row, spacing, 'far')

        k = 1

        loop do
          k += 1

          break if !lines.keys.include?(selector + '-' + k.to_s)
        end

        lines[selector + '-' + k.to_s] = line
      end
    end

    lines
  end

  def parse_pov(file_contents)
    rows = file_contents.split("\n")

    lines = {}

    counter = 1

    rows.each do |row|
      if counter == 1
        @received_date = row[6, 8]
        counter += 1
      end

      type = row[1, 2]

      if type == '13'
        sequence = row[3, 2]
        selector = type.to_s + '' + sequence.to_s
        entity_name = 0

        if selector == '1309'
          name_type = row[175, 1]

          if name_type == 'X'
            entity_name = 1
          end
        end

        spacing = format_spacing(selector, entity_name, 'pov')
        line = parse_line(row, spacing, 'pov')

        k = 1

        loop do
          k += 1

          break if !lines.keys.include?(selector + '-' + k.to_s)
        end

        lines[selector + '-' + k.to_s] = line
      end
    end

    lines
  end

  def parse_file(file_contents)
    file_type = file_contents[29..31]

    if file_type == 'F N'
      file_type = 'POV'
    end

    if @types.keys.include?(file_type.to_s.downcase)
      type = @types[file_type.downcase]

      case type['type']
      when '13'
        data = parse_pov(file_contents)
      when '43'
        data = parse_far(file_contents)
      end
    end

    { data: data, file_type: file_type }
  end

  def format_spacing(selector, entity_name, type)
    name = entity_name == 0 ? 1 : 0

    json = JSON.parse(open('spacing/' + type.to_s + '.json').read)

    if type == 'pov'
      json['1309']['Party Non-Natural Entity Name'] *= entity_name
      json['1309']['Party Last Name'] *= name
      json['1309']['Party First Name'] *= name
      json['1309']['Party Middle Name'] *= name
      json['1309']['Party Prefix'] *= name
      json['1309']['Party Suffix'] *= name
      json['1309']['Party Date of Birth'] *= name
      json['1309']['Party Non-Natural Entity Date'] *= entity_name
    end

    json[selector]
  end

  def parse_line(row, spacing, type)
    line = {}
    start = 0

    spacing.each_with_index do |value, index|
      line[value[0]] = row[start, value[1]].to_s.strip
      start += value[1]
    end

    line
  end

  def get_files
    %x(./get_files.sh)
  end
end

dtcc = Dtcc.new
dtcc.run
