require 'rspec'
require 'spec_helper'
require 'file_cleaner'

describe FileCleaner do

  describe '.remove' do
    before :each do
      @file_path = 'spec/tmp/a_file'
      File.open(@file_path, 'w+') do |f|
        f.write "line 1\n"
        f.write "Remove me\n"
        f.write "line 2\n"
        f.write "line 3\n"
      end
    end

    context 'removing using pattern without passing a range' do
      before do
        FileCleaner.remove(pattern: /Remove me/,
                           file_path: @file_path)
      end
      subject { result }
      it { should eq(["line 1\n", "line 2\n", "line 3\n"]) }
    end

    context 'removing using pattern and range' do
      before do
        FileCleaner.remove(pattern: /Remove me/,
                           file_path: @file_path,
                           range: -1..1)
      end
      subject { result }
      it { should eq(["line 3\n"])}
    end

    context 'removing using pattern and exclusive range' do
      before do
        FileCleaner.remove(pattern: /Remove me/,
                           file_path: @file_path,
                           range: -1...2)
      end
      subject { result }
      it { should eq(["line 3\n"])}
    end

    def result
      f = File.open(@file_path, 'r')
      lines = f.readlines
      f.close
      lines
    end
  end
end