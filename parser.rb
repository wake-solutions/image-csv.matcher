require 'rubygems'
require 'bundler/setup'
Bundler.require
# first = true
#
# CSV.open('complete.csv', 'w') do |csv_new|
#   CSV.foreach('CONDENSED.csv') do |row|
#     if first
#       first = false
#       row.push('URLS')
#       csv_new << row
#       next
#     end
#     imgs = Dir.glob("*#{row[0]}*", File::FNM_CASEFOLD)
#     imgs = imgs.join('|')
#     row.push(imgs)
#     puts row
#     csv_new << row
#   end
# end

first = true

CSV.open('complete2.csv', 'w') do |csv_new|
  CSV.foreach('kuz.csv') do |row|
    if first
      first = false
      row.push('URLS')
      csv_new << row
      next
    end
    imgs = Dir.glob("**/#{row[0]}/*", File::FNM_CASEFOLD)
    imgs.map! do |str|
      str.split('/')[-1]
    end
    imgs = imgs.join('|')
    row.push(imgs)
    csv_new << row

    # temp = row[0]
    # temp = temp.scan(/.{1}|.+/).join('.?')
    # files = Dir['**/**'].select { |x| x =~ /#{temp}\/.*(jpg|jpeg|png)/ }
  end
end
