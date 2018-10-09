## howto.sh

## this is a text file explaining all the steps done
## the .sh ext only for syntax coloring

rails new todolists
cd todolists/
git init
git add .
git commit -m "initial commit"
git remote add origin https://github.com/chenchuk77/todolists.git
# git remote set-url origin git@github.com:chenchuk77/todolists.git
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

# 4. create TodoList model
rails g model todo_list list_name list_due_date:date
rake db:migrate
rspec -e rq04

# 5. Create a database migration 
rails g migration add_user_to_todo_lists user:references
# define relations between models
# class TodoList < ActiveRecord::Base
#  belongs_to :user
#end
#class User < ActiveRecord::Base
#  has_one :profile
#  has_many :todo_lists
#end
rake db:migrate
rspec -e rq05

# 6. create TodoItem model
rails g model todo_item \
      due_date:date \
      title \
      description:text \
      completed:boolean \
      todo_list:references
# define relations between models
# class TodoList < ActiveRecord::Base
#   belongs_to :user
#   has_many :todo_items
# end
# class TodoItem < ActiveRecord::Base
#   belongs_to :todo_list
# end

# 8. :through relations (grandpa -> child)
# class User < ActiveRecord::Base
#   has_one :profile
#   has_many :todo_lists, dependent: :destroy
#   has_many :todo_items, through: :todo_lists, source: :todo_items
# end

# 9. create seeds.rb



######################  module 4 #####################
######################################################


rake db:migrate RAILS_ENV=development
rspec    # fails

rspec spec/start_spec.rb -e rq1.0      # pass



