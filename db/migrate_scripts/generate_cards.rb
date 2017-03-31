require 'csv'
require 'fileutils'

def create_image_cards
  Card::Auth.as_bot do
    csv_text = File.read('db/migrate_scripts/data/upload1.csv')
    csv = CSV.parse(csv_text, headers: false)
    csv.each do |row|
      file_name = row[0]
      @c = Card.create! name: file_name, type: 'image_analysis'
    end
  end
end

def delete_image_subcards
  Card::Auth.as_bot do
    Card.fetch('image analysis').children.each do |this|
      next unless this.name.include? '*type'
      Card.search(right: this.right.name).each do |right_card|
        next if right_card.left
        unless right_card.left.name == 'image analysis'
          puts 'Deleting #{right_card.name}'
          right_card.delete
        end
      end
    end
  end
end

def delete_image_cards
  Card::Auth.as_bot do
    existing_image_card_id = Card.search(type: 'image analysis', return: :id)
    existing_image_card_id.each do |this|
      image_card = Card.fetch(this)
      puts "deleting #{image_card.name}"
      image_card.delete!
    end
  end
end

# def delete_image_cards
#   Card::Auth.as_bot do
#     existing_image_card_id = Card.search(type: 'image analysis', return: :id)
#     puts 'deleting #{existing_image_card_id.size} image_analysis cards'
#     Card.delete existing_image_card_id
#   end
# end

def copy_with_path(src, dst)
  csv_text = File.read('db/migrate_scripts/data/upload1.csv')
  csv = CSV.parse(csv_text, headers: false)
  csv.each do |row|
    file_name = row[0]
    src = 'xxx/all_images/pics/'+file_name
    dst = 'xxx/all_images/upload1/'+file_name
    FileUtils.cp(src, dst)
  end
end
