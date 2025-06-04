# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'csv'

csv_path = Rails.root.join('db', 'data', 'diem_thi_thpt_2024.csv')

puts "Importing data from : #{csv_path}"

# CSV.foreach(csv_path, headers: true) do |row|
#   Student.create!(
#     registration_number: row['sbd'],
#     math: row['toan'],
#     literature: row['ngu_van'],
#     english: row['ngoai_ngu'],
#     physics: row['vat_li'],
#     chemistry: row['hoa_hoc'],
#     biology: row['sinh_hoc'],
#     history: row['lich_su'],
#     geography: row['dia_li'],
#     civic_education: row['gdcd']
#   )
# end

records = []

CSV.foreach(csv_path, headers: true).with_index do |row, index|
  records << {
    registration_number: row['sbd'],
    math: row['toan'],
    literature: row['ngu_van'],
    english: row['ngoai_ngu'],
    physics: row['vat_li'],
    chemistry: row['hoa_hoc'],
    biology: row['sinh_hoc'],
    history: row['lich_su'],
    geography: row['dia_li'],
    civic_education: row['gdcd'],
    created_at: Time.now,
    updated_at: Time.now
  }
end

Student.insert_all(records)
puts "Import successfully"
