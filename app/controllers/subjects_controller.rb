# Authored By   : Sudhanva Shivangere
class SubjectsController < ApplicationController
  
  layout false
  def index
    @subjects=Subject.sorted
  end

  def show
    @subject=Subject.find(params[:id])
  end

    def delete
     @subject=Subject.find(params[:id])
  end

  def destroy
    @subject=Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Successfully Deleted."
    redirect_to(:action=>'index')
  end

  def new
  end

  def create
    # instantiate new object from form parameters
    @subject=Subject.new(subject_params)
    # save the object
    # if save suceeds, redirect to index action
    if @subject.save
      flash[:notice] = "Successfully created." 
      redirect_to(:action=>'index')
    else
    # if save does not suceeds, render the same action
    render(new)
  end
  end

  def edit
   @subject=Subject.find(params[:id])
  end

  def update
    @subject=Subject.find(params[:id])
    # instantiate new object from form parameters
    if @subject.update_attributes(subject_params)
      flash[:notice] = "Successfully updated." 
      redirect_to(:action=>'show',:id=>@subject.id)
    else
    flash[:notice] = "Record not saved." 
    render('edit')
  end
  end

  private
  def subject_params
    params.require(:subject).permit(:name,:position,:visible)
  end
end
