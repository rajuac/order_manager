
namespace :data_insertion do
    desc 'Insert data'
    task insert_data: :environment do
      puts "started"
      
      system('rails runner "DataExtractor::DataInserter.call" > log/data_insert.log 2>&1 &')
      
      puts "start end"
    end
  end
  