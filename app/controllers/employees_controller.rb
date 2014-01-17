class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @metadata = MetaDatum.where(:table_name=>'employee_details')
  end

  # GET /employees/new
  def new
    @employee = Employee.new
    @employee.build_employee_detail
    @metadata = MetaDatum.where(:table_name=>'employee_details')
  end

  # GET /employees/1/edit
  def edit
    @metadata = MetaDatum.where(:table_name=>'employee_details')
  end

  # POST /employees
  # POST /employees.json
  def create
    @fields = MetaDatum.where(:table_name=>'employee_details').pluck('field_name')
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render action: 'show', status: :created, location: @employee }
      else
        format.html { render action: 'new' }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    @fields = MetaDatum.where(:table_name=>'employee_details').pluck('field_name')
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:name, :eid, :department, :title, employee_detail_attributes: { details: @fields })
    end
end
