require 'rake/clean'
require 'pathname'
require 'git-dirty'

SOURCE_DIR = 'src'.freeze

TARGET_DIR = Pathname('public_html')
directory TARGET_DIR
TARGET_FILE = TARGET_DIR / 'index.html'
TEMPLATE_DIR = Pathname('templates')

GPP_DIR = Pathname('gpp')
directory GPP_DIR
DIRTY_FILE = GPP_DIR / '.dirty'
GPP_FILES = FileList["#{GPP_DIR}/index.markdown"]

CLEAN.include GPP_DIR, DIRTY_FILE
CLOBBER.include TARGET_DIR

REVEAL_JS = "reveal.js".freeze
REVEAL_JS_VERSION = '3.7.0'.freeze
REVEAL_JS_TARGET_DIR = TARGET_DIR / REVEAL_JS

desc 'reveal.js is present'
directory REVEAL_JS_TARGET_DIR => TARGET_DIR do |target|
  mkdir target.name

  if ENV['REVEAL_JS_DIR'].to_s.empty?
    warn "Downloading reveal.js #{REVEAL_JS_VERSION}. Set REVEAL_JS_DIR in order to use a cached version."
    sh "curl --location https://github.com/hakimel/reveal.js/archive/#{REVEAL_JS_VERSION}.tar.gz | tar xz -C #{target.name} --strip-components 1"
  else
    warn "Using cached version of reveal.js from #{ENV['REVEAL_JS_DIR']}"
    cp_r FileList["#{ENV['REVEAL_JS_DIR']}/."], target.name, remove_destination: true
  end
end

RESIZABLE_ASSETS = (FileList["assets/*.png"] + FileList["assets/*.jpg"])
RESIZED_ASSETS = RESIZABLE_ASSETS.pathmap("#{TARGET_DIR}/%f")

RESIZED_ASSETS.zip(RESIZABLE_ASSETS).each do |target, source|
  desc "Resize #{source} to #{target}"
  file target => source do
    sh "gm convert #{source} -geometry '1920x1080>' #{target}"
  end
end

ASSET_SOURCES = FileList['assets/*'] - RESIZABLE_ASSETS
ASSETS = ASSET_SOURCES.pathmap("#{TARGET_DIR}/%f") - RESIZED_ASSETS

ASSETS.zip(ASSET_SOURCES).each do |target, source|
  desc "Copy #{source} to #{target}"
  file target => source do
    cp source, target
  end
end

desc "Source are pre-processed into #{TARGET_DIR}"
file "#{GPP_DIR}/index.markdown" => [GPP_DIR, DIRTY_FILE] + FileList["#{SOURCE_DIR}/**/*.markdown"] do |target|
  sh %(gpp -I src -x -o #{target} #{SOURCE_DIR}/index.markdown)
end

git_dirty_file DIRTY_FILE

desc "Build #{TARGET_FILE}"
file TARGET_FILE => [ TARGET_DIR, REVEAL_JS_TARGET_DIR, GPP_FILES, DIRTY_FILE ] + ASSETS + RESIZED_ASSETS do
  sh %(pandoc
      --to=revealjs
      --standalone
      --highlight-style zenburn
      --slide-level=1
      --output #{TARGET_FILE}
      --variable theme=white
      --variable slideNumber=true
      --variable history=true
      --variable revealjs-url=#{REVEAL_JS}
      --include-in-header=#{TARGET_DIR}/customizations.css
    #{GPP_FILES}
  ).split("\n").join(' ')
end

task default: TARGET_FILE
