# frozen_string_literal: true

require 'date'

today = Date.today
this_monday = today - (today.wday - 1)
next_sunday = this_monday + 6
this_monday_str = this_monday.strftime('%Y/%m/%d')
next_sunday_str = next_sunday.strftime('%Y/%m/%d')

file_name = this_monday.strftime('%Y%m%d') + '.md'
p "create #{file_name}"

text = <<~TEMPLATE
  # lifelogs from #{this_monday_str} to #{next_sunday_str}

  ## weekly report

  ## daily reports

  #{(0..6).to_a.map do |idx|
    "### #{(this_monday + idx).strftime('%Y/%m/%d')}\n"
  end.join("\n")}
TEMPLATE

File.open("lifelogs/#{file_name}", 'w') do |f|
  f.puts text
end
