require 'spreadsheet'

namespace :generate_category do
  desc 'Rebuild Categories Table'
  task rebuild_categories: :environment do
    if Category.first.present?
      ActiveRecord::Base.connection.execute('TRUNCATE categories')
    end

    import_categoriess = Spreadsheet.open "#{Rails.root}/db/categories.xls"
    sheet = import_categoriess.worksheet 0
    sheet.each_with_index do |row, index|
      next if index < 1

      category = Category.new
      category.attributes = { id: row[0], parent_id: row[1], name: row[2] }
      category.save!
    end
  end
end
