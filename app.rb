POW_PATH = "#{ENV['HOME']}/.pow"
enable :inline_templates

get '/' do
  @pows = Dir[POW_PATH + "/*"].map { |link| File.basename(link) }
  haml :index
end

__END__

@@ layout
%html
  %title pow index
  = yield

@@ index
%ul
  - @pows.each do |pow|
    %li
      %a{:href => 'http://' + pow + '.dev'} 
        = pow
