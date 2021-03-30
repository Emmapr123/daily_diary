require './lib/database_connection'

def check_env
  if ENV['RACK_ENV'] = 'test'
    DatabaseConnection.setup(dbname: 'diary_entries_test')
  else
    DatabaseConnection.setup(dbname: 'diary_entries')
  end 
end