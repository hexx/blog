# -*- coding: utf-8 -*-
Time.zone = 'Tokyo'

activate :blog do |blog|
  # blog.prefix            = 'blog'
  blog.sources           = 'articles/:year-:month-:day-:title.html'
  blog.layout            = 'article'
  blog.tag_template      = 'tag.html'
  blog.calendar_template = 'calendar.html'
end

page 'feed.xml', :layout => false

require 'slim'

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# activate :deploy do |deploy|
#   deploy.method = :git
#   deploy.branch = 'gh-pages'
# end

activate :sync do |sync|
  sync.fog_provider          = 'AWS'
  sync.fog_directory         = 'blog.pab-tech.net'
  sync.fog_region            = 'ap-northeast-1'
  sync.aws_access_key_id     = ENV['AWS_ACCESS_KEY_ID']
  sync.aws_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
  sync.existing_remote_files = 'keep'
  sync.gzip_compression      = false
  sync.after_build           = false
end

helpers do
  def article_title(article)
    "#{link_to(article.title, article)}&nbsp;<small>#{article.date.strftime('%Y年%m月%d日')}</small>"
  end
end
