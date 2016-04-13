module ApplicationHelper

  def human_readable_languages(languages)
    langs = languages.split

    if langs.size == 1
      return langs[0]
    elsif langs.size == 2
      return langs[0] + ' and ' + langs[1]
    else
      return langs[0...-1].join(', ') + ', and ' + langs[-1]
    end
  end

end
