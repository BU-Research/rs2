bash -c '

 MACHINENAME=silber2

 FULLNAME="Silber 2"

 composer require drupal/bootstrap

 cp -r themes/contrib/bootstrap/starterkits/sass themes/custom/$MACHINENAME

 cd themes/custom/$MACHINENAME

 mv THEMENAME.starterkit.yml $MACHINENAME.info.yml

 sed -i.bak "s/THEMETITLE/$FULLNAME/g" $MACHINENAME.info.yml && rm $MACHINENAME.info.yml.bak

 sed -i.bak "s/THEMENAME/$MACHINENAME/g" $MACHINENAME.info.yml && rm $MACHINENAME.info.yml.bak

 mv THEMENAME.libraries.yml $MACHINENAME.libraries.yml

 mv THEMENAME.theme $MACHINENAME.theme

 mv config/install/THEMENAME.settings.yml config/install/$MACHINENAME.settings.yml

 mv config/schema/THEMENAME.schema.yml config/schema/$MACHINENAME.schema.yml

 sed -i.bak "s/THEMETITLE/$FULLNAME/g" config/schema/$MACHINENAME.schema.yml && rm config/schema/$MACHINENAME.schema.yml.bak

 sed -i.bak "s/THEMENAME/$MACHINENAME/g" config/schema/$MACHINENAME.schema.yml && rm config/schema/$MACHINENAME.schema.yml.bak

 mkdir bootstrap

 curl -sL bootstrap-sass.tar.gz https://github.com/twbs/bootstrap-sass/archive/3.3-stable.tar.gz | tar zxC bootstrap --strip 1

 cp bootstrap/Gemfile Gemfile

 cp bootstrap/bootstrap-sass.gemspec $MACHINENAME.gemspec

 sed -i.bak "s@../lib@../bootstrap/lib@g" $MACHINENAME.gemspec && rm $MACHINENAME.gemspec.bak

 bundle install

 bundle exec compass init --sass-dir scss --css-dir css

 bundle exec compass compile

 '