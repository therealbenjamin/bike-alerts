class ReportsController < ApplicationController
	def show
		@report = Report.new()
	end

	def create
		@report = Report.new(report_params)
		if @report.save
			redirect_to 'http://www.bikewalktn.org/'
		end
	end

	private

	def report_params
		params.require(:report).permit(:incident_type, :feed, :body)
	end
end
