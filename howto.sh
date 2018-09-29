## howto.sh
## this is a text file explaining all the steps done
## the .sh ext only for syntax coloring

rails new todolists
cd todolists/
git init
git add .
git commit -m "initial commit"
git remote add origin https://github.com/chenchuk77/todolists.git
git push -u origin master
vim Gemfile    # add rspec-rails ~> 3.0
bundle
rails g rspec:install
echo "--format documentation" >> .rspec  # verbose output

#
# now overriding local Gemfile from bootsrtap files 
# also copy spec/assignment.rb and README*
#

rspec          # fails (should fail)
rspec -e rq01  # pass test rq01 (directory structure)
git commit -m "passing first test with: rspec -e rq01"
git push 
