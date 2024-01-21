require 'csv'

puts "１（メモを新規で作成）/２（既存のメモを編集する）"
memo_type = gets.chomp.to_s
puts "選択:" + memo_type
input_number = memo_type.chomp

if input_number == "1"
  puts "新規でメモを作成します。拡張子を除いたファイル名を入力してください。"
  file_name = gets.chomp

  puts "メモの内容を入力して下さい。終了したら次行にexitと入力して下さい。"
  input_memo = []
while  (line = gets.chomp) !='exit'
  input_memo << line
end

  CSV.open("#{file_name}.csv", "w") do |csv|
    csv << input_memo
  end
puts "#{file_name}.csvが保存されました。"

elsif input_number == "2"  # Corrected: input_number should be compared as a string
  puts "既存のメモを編集します。拡張子を除いたファイル名を入力して下さい。"
  existing_file_name = gets.chomp

  CSV.foreach("#{existing_file_name}.csv") do |row|
    puts row.join(',')
  end

  puts "メモの内容を入力して下さい。終了したら次行にexitと入力して下さい。"
  input_existing_memo = []
  while  (line = gets.chomp) !='exit'
    input_existing_memo << line
  end

  CSV.open("#{existing_file_name}.csv", "a") do |csv|
    csv << input_existing_memo
  end
  puts "#{file_name}.csvが追記されました。"

else
  puts "１か２のみ選べます。やり直して下さい。"
end
