# -*- coding: utf-8 -*-
Time.zone = 'Tokyo'

activate :blog do |blog|
  blog.sources = 'articles/:year-:month-:day-:title.html'
  blog.layout = 'article'
  blog.tag_template = 'tag.html'
  blog.calendar_template = 'calendar.html'
end

page '/feed.xml', :layout => false

require 'slim'

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

activate :deploy do |deploy|
  deploy.method = :git
  deploy.branch = 'gh-pages'
end

helpers do
  def article_title(article)
    "#{link_to(article.title, article)}&nbsp;<small>#{article.date.strftime('%Y年%m月%d日')}</small>"
  end
end
