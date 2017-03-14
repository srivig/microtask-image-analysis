require 'csv'

Card::Auth.as_bot do
  csv_text = File.read('db/migrate_scripts/data/sampleImageFileList.csv')
  csv = CSV.parse(csv_text, :headers => false)
  csv.each do |row|
    file_name = row[0]
    @c = Card.create! name: file_name, type: 'image_analysis'
  end
end
