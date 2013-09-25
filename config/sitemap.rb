  # Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.weinevents.de"

#SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter
#SitemapGenerator::Sitemap.sitemaps_host = ENV['SITEMAP_HOST']
#SitemapGenerator::Sitemap.public_path = 'tmp/'
#SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do
  add '/about_us', :changefreq => 'monthly', :priority => 0.1
  
  Sitecity.find_each do |sitecity|
    add sitecity_path(sitecity), lastmod: sitecity.updated_at, :priority => 0.9
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
