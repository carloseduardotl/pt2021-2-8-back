class ReportsController < ApplicationController
  before_action :set_report, only: %i[ show update destroy ]

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)

    if @report.save
      render :show, status: :created, location: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    if @report.update(report_params)
      render :show, status: :ok, location: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def report_params
      params.permit(:reply_id, :comment_id)
    end
end
