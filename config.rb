# Unique header generation
require './lib/unique_head.rb'
require 'fileutils'

# Markdown
set :markdown_engine, :redcarpet
set :markdown,
    fenced_code_blocks: true,
    smartypants: true,
    disable_indented_code_blocks: true,
    prettify: true,
    strikethrough: true,
    tables: true,
    with_toc_data: true,
    no_intra_emphasis: true,
    renderer: UniqueHeadCounter

# Assets
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :fonts_dir, 'fonts'

# Activate the syntax highlighter
activate :syntax
ready do
  require './lib/monokai_sublime_slate.rb'
  require './lib/multilang.rb'
end

activate :sprockets

activate :autoprefixer do |config|
  config.browsers = ['last 2 version', 'Firefox ESR']
  config.cascade  = false
  config.inline   = true
end

# Github pages require relative links
activate :relative_assets
set :relative_links, true

# Internationalization support
activate :i18n, :mount_at_root => false
redirect "index.html", :to => "./hk/index.html"

# Build Configuration
configure :build do
  # We do want to hash woff and woff2 as there's a bug where woff2 will use
  # woff asset hash which breaks things. Trying to use a combination of ignore and
  # rewrite_ignore does not work as it conflicts weirdly with relative_assets. Disabling
  # the .woff2 extension only does not work as .woff will still activate it so have to
  # have both. See https://github.com/slatedocs/slate/issues/1171 for more details.
  activate :asset_hash, :exts => app.config[:asset_extensions] - %w[.woff .woff2]
  # If you're having trouble with Middleman hanging, commenting
  # out the following two lines has been known to help
  activate :minify_css
  activate :minify_javascript
  # activate :gzip
  
  # Copy language-specific logo files to build directory
  # These files need to be explicitly copied since they may not be recognized as resources
  after_build do
    source_images_dir = File.join(app.root, 'source', 'images')
    build_images_dir = File.join(app.root, 'build', 'images')
    
    # Ensure build/images directory exists
    FileUtils.mkdir_p(build_images_dir) unless File.directory?(build_images_dir)
    
    # Copy all language-specific logo files (logo.*.png except logo.png)
    Dir.glob(File.join(source_images_dir, 'logo.*.png')).each do |logo_file|
      basename = File.basename(logo_file)
      # Skip the default logo.png as it's already copied by Middleman
      next if basename == 'logo.png'
      
      dest_file = File.join(build_images_dir, basename)
      FileUtils.cp(logo_file, dest_file) if File.exist?(logo_file)
      puts "Copied #{basename} to build/images/"
    end
  end
end

# Deploy Configuration
# If you want Middleman to listen on a different port, you can set that below
set :port, 4567

helpers do
  require './lib/toc_data.rb'
end
