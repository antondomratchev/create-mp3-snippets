#! /usr/bin/env ruby
input = ARGV[0]
output = ARGV[1]
ext = ".mp3"

if input.nil? && output.nil?
  puts "Please provice input and output directories example:
  create-mp3-snippets input/directory output/directory"
  exit
end

Dir.chdir(input) do |dir|
  names = Dir["*#{ext}"]
  
  names.each do |name|
    `ffmpeg -ss 5 -i "#{name}" -t 00:00:22.500 "#{output}/preview_#{name}"`
  end
end
