# coding: utf-8
# USAGE: ruby ttf2png_devicons.rb

# inspired by ttf2png.rb from https://github.com/yukinoraru/ttf2png
#//-------------------------------------------
# Config:
#//-------------------------------------------

FONT      = "devicon.ttf"
FONT_SIZES = [
  64,
  128,
  600
]

inames = { 
  "\uE600" => "react-original-wordmark",
  "\uE601" => "react-original",
  "\uE602" => "symfony-original-wordmark",
  "\uE603" => "amazonwebservices-original",
  "\uE604" => "amazonwebservices-plain-wordmark",
  "\uE605" => "symfony-original",
  "\uE606" => "redis-plain-wordmark",
  "\uE607" => "redis-plain",
  "\uE608" => "meteor-plain-wordmark",
  "\uE609" => "meteor-plain",
  "\uE60A" => "heroku-line-wordmark",
  "\uE60B" => "heroku-line",
  "\uE60C" => "heroku-plain-wordmark",
  "\uE60D" => "android-plain-wordmark",
  "\uE60E" => "android-plain",
  "\uE60F" => "heroku-plain",
  "\uE610" => "go-line",
  "\uE611" => "nodewebkit-line-wordmark",
  "\uE612" => "nodewebkit-line",
  "\uE613" => "nodewebkit-plain-wordmark",
  "\uE614" => "nodewebkit-plain",
  "\uE615" => "nginx-original",
  "\uE616" => "erlang-plain-wordmark",
  "\uE617" => "erlang-plain",
  "\uE618" => "doctrine-line-wordmark",
  "\uE619" => "doctrine-line",
  "\uE61A" => "doctrine-plain-wordmark",
  "\uE61B" => "go-plain",
  "\uE61C" => "angularjs-plain-wordmark",
  "\uE61D" => "angularjs-plain",
  "\uE61E" => "docker-plain-wordmark",
  "\uE61F" => "docker-plain",
  "\uE620" => "appcelerator-original",
  "\uE621" => "appcelerator-plain-wordmark",
  "\uE622" => "apple-original",
  "\uE623" => "atom-original-wordmark",
  "\uE624" => "atom-original",
  "\uE625" => "doctrine-plain",
  "\uE626" => "apache-line-wordmark",
  "\uE627" => "apache-line",
  "\uE628" => "apache-plain-wordmark",
  "\uE629" => "apache-plain",
  "\uE62A" => "redhat-plain-wordmark",
  "\uE62B" => "redhat-plain",
  "\uE62C" => "backbonejs-plain-wordmark",
  "\uE62D" => "backbonejs-plain",
  "\uE62E" => "bootstrap-plain-wordmark",
  "\uE62F" => "bootstrap-plain",
  "\uE630" => "bower-line-wordmark",
  "\uE631" => "bower-line",
  "\uE632" => "safari-line-wordmark",
  "\uE633" => "gimp-plain",
  "\uE634" => "cplusplus-line",
  "\uE635" => "cplusplus-plain",
  "\uE636" => "csharp-line",
  "\uE637" => "csharp-plain",
  "\uE638" => "c-line",
  "\uE639" => "c-plain",
  "\uE63A" => "safari-line",
  "\uE63B" => "safari-plain-wordmark",
  "\uE63C" => "safari-plain",
  "\uE63D" => "jetbrains-plain",
  "\uE63E" => "django-line",
  "\uE63F" => "django-plain",
  "\uE64E" => "bower-plain-wordmark",
  "\uE64F" => "bower-plain",
  "\uE665" => "chrome-plain-wordmark",
  "\uE666" => "chrome-plain",
  "\uE667" => "codeigniter-plain-wordmark",
  "\uE668" => "codeigniter-plain",
  "\uE669" => "coffeescript-original-wordmark",
  "\uE66A" => "coffeescript-original",
  "\uE678" => "css3-plain-wordmark",
  "\uE679" => "css3-plain",
  "\uE67E" => "debian-plain-wordmark",
  "\uE67F" => "debian-plain",
  "\uE6d3" => "dot-net-plain-wordmark",
  "\uE6d4" => "dot-net-plain",
  "\uE6e2" => "drupal-plain-wordmark",
  "\uE6e3" => "drupal-plain",
  "\uE75D" => "firefox-plain-wordmark",
  "\uE75E" => "firefox-plain",
  "\uE7a2" => "foundation-plain-wordmark",
  "\uE7a3" => "foundation-plain",
  "\uE7a7" => "git-plain-wordmark",
  "\uE7a8" => "git-plain",
  "\uE7a9" => "grunt-line-wordmark",
  "\uE7aA" => "grunt-line",
  "\uE7eA" => "grunt-plain-wordmark",
  "\uE7eB" => "grunt-plain",
  "\uE7eC" => "gulp-plain",
  "\uE7f6" => "html5-plain-wordmark",
  "\uE7f7" => "html5-plain",
  "\uE7f8" => "ie10-original",
  "\uE7f9" => "illustrator-line",
  "\uE7fA" => "illustrator-plain",
  "\uE834" => "inkscape-plain-wordmark",
  "\uE835" => "inkscape-plain",
  "\uE841" => "java-plain-wordmark",
  "\uE842" => "java-plain",
  "\uE845" => "javascript-plain",
  "\uE849" => "jquery-plain-wordmark",
  "\uE84A" => "jquery-plain",
  "\uE84F" => "krakenjs-plain-wordmark",
  "\uE850" => "krakenjs-plain",
  "\uE851" => "laravel-plain-wordmark",
  "\uE852" => "laravel-plain",
  "\uE853" => "less-plain-wordmark",
  "\uE8f1" => "gradle-plain-wordmark",
  "\uE900" => "protractor-plain",
  "\uE901" => "protractor-plain-wordmark",
  "\uE902" => "gradle-plain",
  "\uE903" => "jeet-plain",
  "\uE904" => "cucumber-plain",
  "\uE905" => "cucumber-plain-wordmark",
  "\uE906" => "jeet-plain-wordmark",
  "\uE907" => "gitlab-plain",
  "\uE908" => "gitlab-plain-wordmark",
  "\uE909" => "github-original",
  "\uE90A" => "github-original-wordmark",
  "\uE90B" => "d3js-plain",
  "\uE90C" => "d3js-original",
  "\uE90D" => "confluence-original",
  "\uE90E" => "confluence-original-wordmark",
  "\uE90F" => "bitbucket-original",
  "\uE910" => "bitbucket-original-wordmark",
  "\uE911" => "phpstorm-plain",
  "\uE912" => "phpstorm-plain-wordmark",
  "\uE913" => "sourcetree-original",
  "\uE914" => "sourcetree-original-wordmark",
  "\uE915" => "ssh-original",
  "\uE916" => "ssh-original-wordmark",
  "\uE917" => "gatling-plain",
  "\uE918" => "gatling-plain-wordmark",
  "\uE919" => "mocha",
  "\uE91A" => "jasmine-plain",
  "\uE91B" => "jasmine-wordmark",
  "\uE91C" => "facebook-plain",
  "\uE91D" => "google-plain-wordmark",
  "\uE91E" => "google-plain",
  "\uE91F" => "twitter-original",
  "\uE920" => "typescript-plain",
  "\uE921" => "babel-plain",
  "\uE922" => "sequelize-plain-wordmark",
  "\uE923" => "sequelize-plain",
  "\uE924" => "slack-plain-wordmark",
  "\uE925" => "slack-plain",
  "\uE926" => "visualstudio-plain-wordmark",
  "\uE927" => "visualstudio-plain",
  "\uE928" => "webpack-plain-wordmark",
  "\uE929" => "webpack-plain",
  "\uE92A" => "swift-plain-wordmark",
  "\uE92B" => "swift-plain",
  "\uE92C" => "tomcat-line-wordmark",
  "\uE92D" => "tomcat-line",
  "\uE92E" => "vuejs-line-wordmark",
  "\uE92F" => "vuejs-line",
  "\uE930" => "vuejs-plain-wordmark",
  "\uE931" => "vuejs-plain",
  "\uE932" => "intellij-plain-wordmark",
  "\uE933" => "intellij-plain",
  "\uE934" => "pycharm-plain-wordmark",
  "\uE935" => "pycharm-plain",
  "\uE936" => "rubymine-plain-wordmark",
  "\uE937" => "rubymine-plain",
  "\uE938" => "webstorm-plain-wordmark",
  "\uE939" => "webstorm-plain",
  "\uE93A" => "devicon-plain-wordmark",
  "\uE93B" => "devicon-plain",
  "\uE93C" => "express-original-wordmark",
  "\uE93D" => "express-original",
  "\uE93E" => "stylus-original",
  "\uE93F" => "cakephp-plain-wordmark",
  "\uE940" => "cakephp-plain",
  "\uE941" => "elm-plain-wordmark",
  "\uE942" => "elm-plain",
  "\uE943" => "behance-plain-wordmark",
  "\uE944" => "ceylon-plain",
  "\uE945" => "behance-plain",
  "\uE946" => "linkedin-plain-wordmark",
  "\uE947" => "linkedin-plain",
  "\uE948" => "couchdb-plain-wordmark",
  "\uE949" => "couchdb-plain",
  "\uE94A" => "handlebars-plain-wordmark",
  "\uE94B" => "handlebars-plain",
  "\uE94C" => "sketch-line-wordmark",
  "\uE94D" => "sketch-line",
  "\uE94E" => "vagrant-plain-wordmark",
  "\uE94F" => "vagrant-plain",
  "\uE950" => "yarn-plain-wordmark",
  "\uE951" => "yarn-plain",
  "\uE952" => "npm-original-wordmark",
  "\uE953" => "ionic-original-wordmark",
  "\uE954" => "ionic-original",
  "\uE955" => "ember-original-wordmark",
  "\uE956" => "electron-original-wordmark",
  "\uE957" => "electron-original",
  "\uEb1C" => "linux-plain",
  "\uEb43" => "mongodb-plain-wordmark",
  "\uEb44" => "mongodb-plain",
  "\uEb5A" => "moodle-plain-wordmark",
  "\uEb5B" => "moodle-plain",
  "\uEb60" => "mysql-plain-wordmark",
  "\uEb61" => "mysql-plain",
  "\uEb69" => "nodejs-plain-wordmark",
  "\uEb6A" => "nodejs-plain",
  "\uEb6B" => "oracle-original",
  "\uEb6C" => "photoshop-line",
  "\uEb6D" => "photoshop-plain",
  "\uEb71" => "php-plain",
  "\uEb7C" => "postgresql-plain-wordmark",
  "\uEb7D" => "postgresql-plain",
  "\uEb88" => "python-plain-wordmark",
  "\uEb89" => "python-plain",
  "\uEba2" => "rails-plain-wordmark",
  "\uEba3" => "rails-plain",
  "\uEbc9" => "ruby-plain-wordmark",
  "\uEbcA" => "ruby-plain",
  "\uEbcB" => "sass-original",
  "\uEbcC" => "travis-plain-wordmark",
  "\uEbcD" => "travis-plain",
  "\uEbcE" => "trello-plain-wordmark",
  "\uEbcF" => "trello-plain",
  "\uEbd0" => "ubuntu-plain-wordmark",
  "\uEbd1" => "ubuntu-plain",
  "\uEbf3" => "vim-plain",
  "\uEbf4" => "windows8-original-wordmark",
  "\uEbf5" => "windows8-original",
  "\uEbfD" => "wordpress-plain-wordmark",
  "\uEbfE" => "wordpress-plain",
  "\uEc01" => "yii-plain-wordmark",
  "\uEc02" => "yii-plain",
  "\uEc03" => "zend-plain-wordmark",
  "\uEc04" => "zend-plain"
}

#//-------------------------------------------

for font_size in FONT_SIZES
  directory = "png_#{font_size}"
  Dir.mkdir(directory) unless File.exists?(directory)

  inames.each do |key, value|
    cmd = "convert -background none -fill black -font #{FONT} -pointsize #{font_size} label:\"#{key}\"  #{directory}/#{value}.png"
      puts cmd
      system(cmd) if ARGV[0]
  end
end

print sprintf("If you want to execute these commands, try this: \nruby %s 1\n", File.basename(__FILE__)) if ARGV.length == 0
