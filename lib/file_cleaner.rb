require "file_cleaner/version"

module FileCleaner
  def self.remove args
    file_path = args[:file_path]
    pattern = args[:pattern]
    range = args.fetch(:range, 0..0)

    lines = []
    File.open(file_path, 'r') do |f|
      lines = f.readlines
    end

    match_indexes = lines.each_with_index.select { |line,_| line =~ pattern }.map { |_, index| index }
    match_indexes.each do |match_index|
      moved_range = Range.new(range.begin + match_index, range.end + match_index, range.exclude_end?)
      lines.fill(nil, moved_range)
    end
    result = lines.compact

    File.open(file_path, 'w+') do |f|
      result.each do |line|
        f.write line
      end
    end
  end
end
