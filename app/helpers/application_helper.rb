module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    "http://github.com/#{author}/#{repo}"
  end

  def flash_mes(type)
    content_tag :p, flash[type], class: "flash #{type}" if type.present?
  end

end
