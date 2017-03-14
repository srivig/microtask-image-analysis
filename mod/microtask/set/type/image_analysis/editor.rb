format :html do
  view :content_formgroup do |args|
    image_name = card.name
    image_url = 'https://wagntest.s3.amazonaws.com/files/sample_images/' + image_name
    load_image = image_tag(image_url, class: 'profile_image')
    content_tag(:div, load_image) + super(args)
  end
end
