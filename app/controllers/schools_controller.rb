class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def show
    @school = School.find(params[:id])
  end

  def edit
    #Get - show a form to edit a school
    @school = School.find(params[:id])
  end

  def update
    # PUT - update columns in a school
    @school = School.find(params[:id])
    if @school.update(school_params)
      redirect_to school_path(@school)
    else
      render :edit
    end
  end

  def new
    #GET show a form to create a new school
    @school = School.new
  end

  def create
    # POST - creating a new school record in the database
    @school = School.new(school_params)
    if @school.save
      #successful save in our database
      redirect_to schools_path
    else
      #something went wrong
      render :new
    end
  end

  def destroy
    #delete a single school out of the database
    School.find(params[:id]).destroy
    redirect_to schools_path
  end

private

  def school_params
    params.require(:school).permit(:name, :year_built)

  end
end
