def setup_test_database
  connection = PG.connect(dbname: 'MareBnB-test')

  connection.exec("TRUNCATE listings, users, availabilities;")
ensure
  connection&.close
end
