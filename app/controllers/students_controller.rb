class StudentsController < ApplicationController

  def index
    if params[:query]
      students = Student.where("lower(first_name) LIKE ? OR lower(last_name) LIKE ?", "%#{params[:query].downcase}%", "%#{params[:query].downcase}%")
    elsif params[:name]
      students = Student.where("lower(first_name) LIKE ? OR lower(last_name) LIKE ?", "%#{params[:name].downcase}%", "%#{params[:name].downcase}%")
    else
      students = Student.all
    end
    render json: @students || []
  end
  def show
    student = Student.find(params[:id])
    render json: student
  end

end
