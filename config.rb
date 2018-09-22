activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :sprockets

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page '/*.md', layout: false
page 'index.html', layout: false

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :relative_assets
  set :relative_links, true
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.deploy_method = :git
end

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  blog.name = "projets"
  blog.prefix = "projets"

  # blog.permalink = "{year}/{month}/{day}/{title}.html"
  # Matcher for blog source files
  blog.sources = "{year}-{month}-{day}_{title}.html"
  # blog.taglink = "tags/{tag}.html"
  blog.layout = "blog_layout"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  blog.default_extension = ".md"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
end

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  blog.name = "reviews"
  blog.prefix = "reviews"

  blog.sources = "{year}-{month}-{day}_{title}.html"
  blog.layout = "blog_layout"

  blog.default_extension = ".md"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"
end


activate :dato,
  token: '84c24daaaaace03672cc48af61d6e2',
  base_url: 'https://wonderful-sammet-fd7ce6.netlify.com'