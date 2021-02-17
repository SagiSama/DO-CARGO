ActionView::Base.field_error_proc = proc do |html_tag, instance|
  html_tag.gsub("form-control", "form-control error").html_safe
  unless html_tag =~ /^<label/
    %{<div class="has-error">#{html_tag}<label class="error">#{instance.error_message.join(', ')}</label></div>}.html_safe
  else
    %{#{html_tag}}.html_safe
  end
end

