require 'csv'

CSV.open('seed-invia.csv','w') do |csv|
  csv << ["name", "keywords", "description", "url"]
  metiers.each do |metier|
    Job.create(name: metier[:name], keywords: metier[:keywords], description: metier[:description], url: metier[:url])
  end
end
