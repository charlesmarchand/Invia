require 'csv'

csv_options = { col_sep: ';'}

CSV.foreach('seed-invia.csv', csv_options) do |row|
  job = Job.create(name: "#{row[0]}", description: "#{row[2]}", url: "#{row[3]}")
  row[1].split(",").each do |keyword|
    if ! Keyword.find_by_name("#{keyword}").nil?
      job.keywords << Keyword.find_by_name("#{keyword}")
    else
      job.keywords << Keyword.create(name: "#{keyword}")
    end
  end
end
