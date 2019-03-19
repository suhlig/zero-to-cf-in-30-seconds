require 'rake/clean'
require 'pathname'

TARGET_DIR = Pathname('public_html')
directory TARGET_DIR
TARGET_FILE = TARGET_DIR / 'index.html'
TEMPLATE_DIR = Pathname('templates')

GPP_DIR = Pathname('gpp')
directory GPP_DIR
DIRTY_FILE = GPP_DIR / '.dirty'
GPP_FILES = FileList["#{GPP_DIR}/index.markdown"]
CLEAN.include GPP_DIR

CLEAN.include FileList[
  "#{TARGET_DIR}/*.html",
  "#{TARGET_DIR}/*.svg",
  DIRTY_FILE,
]

CLOBBER.include TARGET_DIR

SOURCE_DIR = 'src'.freeze
SOURCE_FILES = GPP_FILES.pathmap("#{SOURCE_DIR}/%f")

REVEAL_JS_VERSION = '3.7.0'.freeze
REVEAL_JS_VERSIONED_NAME = "reveal.js-#{REVEAL_JS_VERSION}".freeze
REVEAL_JS_DIR = TARGET_DIR / REVEAL_JS_VERSIONED_NAME
REVEAL_JS_BASE = 'https://github.com/hakimel/reveal.js/archive'.freeze
REVEAL_JS_DOWNLOAD_URL = "#{REVEAL_JS_BASE}/#{REVEAL_JS_VERSION}.tar.gz".freeze

desc 'reveal.js is present'
directory REVEAL_JS_DIR => TARGET_DIR do |task|
  sh "curl --location #{REVEAL_JS_DOWNLOAD_URL} | tar xz -C #{TARGET_DIR}"
end

desc "Assets are in #{TARGET_DIR}"
task :assets do
  FileList['assets/*'].each do |source|
    target = File.join(TARGET_DIR, File.basename(source))
    cp_r source, target
  end
end

desc "Source are pre-processed into #{TARGET_DIR}"
file "#{GPP_DIR}/index.markdown" => ["#{SOURCE_DIR}/index.markdown", GPP_DIR, DIRTY_FILE] + FileList["#{SOURCE_DIR}/**/*.markdown"] do |target|
  sh %(gpp -I src -x -o #{target} #{SOURCE_DIR}/index.markdown)
end

desc "#{DIRTY_FILE} shows git status"
file DIRTY_FILE do |target_file|
  rev = `git rev-parse --short HEAD`.chomp

  if `git status --porcelain`.chomp.empty?
    File.write target_file.to_s, rev
  else
    File.write target_file.to_s, "#{rev}*"
  end
end

desc "Build #{TARGET_FILE}"
file TARGET_FILE => [ TARGET_DIR, REVEAL_JS_DIR, GPP_FILES, :assets, DIRTY_FILE ] do
  sh %(pandoc
      --to=revealjs
      --standalone
      --highlight-style zenburn
      --slide-level=1
      --output #{TARGET_FILE}
      --variable theme=white
      --variable slideNumber=true
      --variable history=true
      --variable revealjs-url=#{REVEAL_JS_VERSIONED_NAME}
      --include-in-header=#{TARGET_DIR}/customizations.css
    #{GPP_FILES}
  ).split("\n").join(' ')
end

task default: TARGET_FILE
