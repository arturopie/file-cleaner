require "file_cleaner/version"

module FileCleaner
  def self.remove args
    file_path = args[:file_path]
    pattern = args[:pattern]

    lines = []
    File.open(file_path, 'r') do |f|
      lines = f.readlines
    end

    result = lines.reject do |line|
      line =~ pattern
    end

    File.open(file_path, 'w+') do |f|
      result.each do |line|
        f.write line
      end
    end
  end
end
