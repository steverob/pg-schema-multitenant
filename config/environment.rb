# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
SaasDemo::Application.initialize!

SHARED_TABLES = ['users', 'accounts']

DYNAMIC_TABLES = ['employee_details']
