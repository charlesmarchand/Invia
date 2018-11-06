require 'csv'

csv_options = { col_sep: ';'}

puts 'Cleaning'
User.destroy_all
Profile_saved_info.destroy_all
Job.destroy_all
Diploma.destroy_all
Study.destroy_all
Category.destroy_all
Keyword.destroy_all
Professionnal.destroy_all
School.destroy_all

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
  diploma = Diploma.create(name: "#{row[0]}", description: "#{row[3]}", length: "#{row[1]}", cost: "#{row[2]}")
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

