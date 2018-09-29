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

# An Entity Relationship (ER) diagram 
#
# |------| 1      1 |---------|
# | User |----------| Profile |
# |------|          |---------|
#     \
#      \
#       \ 1   * |----------| 1      * |----------|
#        \------| TodoList |----------| TodoItem |
#               |----------|          |----------|

# 1. test rails app structure
rspec          # fails (should fail)
rspec -e rq01  # pass test rq01 (directory structure)
git commit -m "passing first test with: rspec -e rq01"
git push 

# 2. creating User model
rails g model user username password_digest
rake db:migrate
rspec -e rq02  # pass test rq02 (user model)

# 3. create Profile model 
rails g model profile gender birth_year:integer first_name last_name user:references

# define the User model relation to Profile.
# NOTE: Profile model relation (belongs_to: user) defined automatically by 'user:references')

# user.rb
# class User < ActiveRecord::Base
#   has_one :profile
# end

rake db:migrate
rspec -e rq03

