require 'csv'

puts "１（メモを新規で作成）/２（既存のメモを編集する）"
memo_type = gets.chomp.to_s
puts "選択:" + memo_type
input_number = memo_type.chomp

if input_number == "1"
  puts "新規でメモを作成します。拡張子を除いたファイル名を入力してください。"
  file_name = gets.chomp

  puts "メモの内容を入力して下さい。Ctrl+Dで保存します。"
  input_memo = STDIN.read
  memo = input_memo.chomp

  CSV.open("#{file_name}.csv", "w") do |csv|
    csv << [memo]
  end

elsif input_number == "2"  # Corrected: input_number should be compared as a string
  puts "既存のメモを編集します。拡張子を除いたファイル名を入力して下さい。"
  existing_file_name = gets.chomp

  CSV.foreach("#{existing_file_name}.csv") do |row|
    puts row.join(',')
  end

  puts "メモの内容を入力してENTERをおして下さい。Ctrl+Dで保存します。"
  input_existing_memo = STDIN.read
  existing_memo = input_existing_memo.chomp

  CSV.open("#{existing_file_name}.csv", "a") do |csv|
    csv << [existing_memo]
  end
else
  puts "１か２のみ選べます。"
end
