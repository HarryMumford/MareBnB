def setup_test_database
  connection = PG.connect(dbname: 'MareBnB-test')

  connection.exec("TRUNCATE listings, users;")
ensure
  connection&.close
end
