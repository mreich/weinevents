  # Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.weinevents.de"

SitemapGenerator::Sitemap.sitemaps_host = "http://s3.amazonaws.com/weinevents/"
SitemapGenerator::Sitemap.public_path = 'tmp/'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new


SitemapGenerator::Sitemap.create do
  add '/about_us', :changefreq => 'monthly', :priority => 0.1
  
  Sitecity.find_each do |sitecity|
    add sitecity_path(sitecity), :changefreq => 'daily', :priority => 0.9
  end

  Tag.find_each do |tag|
    add tag_path(tag.name), :changefreq => 'weekly', :priority => 0.8
  end

  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
