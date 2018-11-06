require 'csv'

csv_options = { col_sep: ';'}

puts 'Cleaning'

Job.destroy_all
Diploma.destroy_all
Study.destroy_all

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

CSV.foreach('seed-diplomasUTF8.csv', csv_options) do |row|
  diploma = Diploma.create(name: "#{row[0]}", description: "#{row[3]}", length: "#{row[1]}", difficulty: "#{row[2]}")
end


CSV.foreach('seed-studies.csv', csv_options) do |row|
  job = Job.find_by_name(row[0])
  row[1].split(",").each do |study|
    stu = Study.create(name: "#{study}")
    job.studies << stu
      study.split("+").each do |diploma|
        stu.diplomas << Diploma.find_by_name("#{diploma}")
      end
  end
end

CSV.foreach('seed-schools.csv', csv_options) do |row|
  school = School.create(name: "#{row[0]}", address: "#{row[1]}", cost: "#{row[2]}", url: "#{row[3]}", web_site: "#{row[4]}", difficulty: "#{row[5]}", description: "#{row[6]}")
end

CSV.foreach('seed-studies_schools.csv', csv_options) do |row|
  p row[0]
  diploma = Diploma.find_by_name("#{row[0]}")
  p diploma
  row[1].split(",").each do |school|
    if ! School.find_by_name("#{school}").nil?
     diploma.schools << School.find_by_name("#{school}")
    else
      diploma.schools << School.create(name: "#{school}")
    end
  end
end


