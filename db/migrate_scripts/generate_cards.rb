require 'csv'

def create_image_cards
  Card::Auth.as_bot do
    csv_text = File.read('db/migrate_scripts/data/sampleImageFileList.csv')
    csv = CSV.parse(csv_text, headers: false)
    csv.each do |row|
      file_name = row[0]
      @c = Card.create! name: file_name, type: 'image_analysis'
    end
  end
end

def delete_image_cards
  Card::Auth.as_bot do
    existing_image_card_id = Card.search(type: 'image analysis', return: :id)
    puts 'deleting #{existing_image_card_id.size} image_analysis cards'
    Card.delete existing_image_card_id
  end
end
