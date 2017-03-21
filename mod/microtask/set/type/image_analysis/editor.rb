format :html do
  view :content_formgroup do |args|
    image_name = card.name
    image_url = 'https://wagntest.s3.amazonaws.com/files/sample_images/' + image_name
    load_image = image_tag(image_url, class: 'profile_image')
    card_structure = card.structure.content
    card_structure.scan(/\{\{([^\}]*)\}\}/).each do |incs|
      incs = incs[0].to_s.split("|", 2)[0]
      subcard = incs.split("+",2)[1]
      nest_regex = /\{\{\+#{subcard}\|([^\}]*)\}\}/
      css_attr = subcard.parameterize.underscore
      field_html = field_nest(subcard, new: {})
      field_html = field_html.gsub "pointer-radio-no", "pointer-radio-no"+css_attr
      field_html = field_html.gsub "pointer-radio-ye", "pointer-radio-ye"+css_attr
      card_structure.gsub! nest_regex, field_html
    end
    # card.includees.each do |subcard|
    #   nest_regex = /\{\{\+#{subcard.right.name}\|([^\}]*)\}\}/
    #
    #   binding.binding.binding.pry
    #   card_structure.gsub! nest_regex, field_nest(subcard, new: {})
    # end
    # subcards = card.fields.collect { |subcard| wrap_fields(subcard) }.join('')
    super_content = content_tag(:div, card_structure.html_safe, class: "main-form-content")
    content_tag(:div, load_image, class: "image-container") + super_content
    # binding.pry
  end
  def wrap_fields subcard
    title = content_tag(:h4, subcard.name)
    wrap_with :div do
      [
        title,
        nest(subcard)
      ]
    end
  end
end
