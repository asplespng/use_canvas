class DatePickerInput < SimpleForm::Inputs::StringInput
  # Builds options for the dateicker input, sets it's value using
  # Rails's date format and adds behaviour: 'datepicker' to its date-atrributes.
  def input_html_options
    value = object.send(attribute_name)
    options = {
      value: value.nil? ? nil : value.strftime("%Y-%m-%d"),
      data: { behaviour: 'datepicker' },  # for example
      autoOpen: "false"
      # setDate: value.strftime("%m/%d%Y")
    }
    # add all html option you need...
    super.merge options
  end

  # Adds the "datepicker" class to the input element
  def input_html_classes
    super.push('form-control datepicker')
  end

  # Builds the input text field and an hidden field with class attribute_name-alt
  def input(wrapper_options)
    template.content_tag(:div, class: "input-group") do
      template.concat @builder.text_field(attribute_name, input_html_options)
      template.concat template.content_tag(:span, class: 'input-group-addon'){icon_table}
      template.concat @builder.hidden_field(attribute_name, value: input_html_options[:value], class: attribute_name.to_s + "-alt")
    end
  end


  def icon_table
    "<i class='glyphicon glyphicon-th'></i>".html_safe
  end
end
