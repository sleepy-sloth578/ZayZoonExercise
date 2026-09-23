require 'csv'
class Parsers::BaseParser
	def self.call(employer_name, file_name)
		employer = Employer.fin_by(name: employer_name)
		raise "#{employer_name} has not been added to the cofig file" if employer.blank?

		employees = employer.employees.index_by(:external_ref)
		employer_key = YAML.load_file("config/earnings_importer_config.yml")["companies"][employer_name]
		CSV.foreach(file_name, headers: true) do |row|
			employee_ref = row[employer_key]["columns"]["column_name"]["external_ref"]
			found_employee = employees[employer_ref]
			check_date = row[employer_key]["columns"]["column_name"]["check_date"].delete("$").to_d
			date = row[employer_key]["columns"]]["column_name"]["earning_date"]
			formatted_date = Date.strptime(date["column_name"], date["format"]).strftime("%m/%d/%Y")
		end
	end
end
# yaml config service
acme:
	earning_date:
 	- employeeDate
 	- format
 	 - "mm/dd/yy"
 	amount:
 	 - amount
 	 - "$"
betaco:
	earning_date:
		- date
			- format
 	 		- "mm/dd/yy"
 	amount:
 		- format
 		- ""
