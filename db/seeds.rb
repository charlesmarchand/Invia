require 'csv'

csv_options = { col_sep: ';'}

CSV.foreach('seed-jobs.csv', csv_options) do |row|
  job = Job.create(name: "#{row[0]}", description: "#{row[2]}", url: "#{row[3]}")
  row[1].split(",").each do |keyword|
    if ! Keyword.find_by_name("#{keyword}").nil?
      job.keywords << Keyword.find_by_name("#{keyword}")
    else
      job.keywords << Keyword.create(name: "#{keyword}")
    end
  end
end

CSV.foreach('seed-diplomas.csv', csv_options) do |row|
  diploma = Diploma.create(name: "#{row[0]}", description: "#{row[3]}", length: "#{row[1]}", cost: "#{row[2]}")
end

CSV.foreach('seed-studies.csv', csv_options) do |row|
  job = Job.find_by_name("#{row[0]}")
  row[1].split(",").each do |study|
    job.studies << Study.create(name: "#{study}")
    study.split("+").each do |diploma|
      study.diplomas << Diploma.find_by_name("#{diploma}")
    end
  end
end



