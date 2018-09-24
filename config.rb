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

activate :dato,
  token: '3c4d35d10bd4da8f492a8570ad39ca',
  base_url: 'https://goofy-roentgen-7dfec9.netlify.com/'

dato.projets.each_with_index do |_info, i|
  proxy "/projets/#{i}.html", "/projets/show.html", locals: { index: i }, ignore: true
end
