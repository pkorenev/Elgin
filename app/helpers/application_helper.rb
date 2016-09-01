module ApplicationHelper
  def main_menu_items
    menu(%w(root about_us services contact))
  end

  def main_menu_secondary_items
    menu(%w(terms_and_conditions))
  end

  def footer_menu_items
    menu(%w(root about_us services contact terms_and_conditions))
  end

  def input_template(type, required, placeholder_str, input_tag_str)
    "<div class='input #{type} #{'required' if required} '>#{input_tag_str}<div class='background-red'></div>#{placeholder_str}</div>"
  end
end
