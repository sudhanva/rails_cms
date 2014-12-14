class PagesController < ApplicationController
  layout "admin"
  def index
    @pages=Page.all
  end

  def show
    @page=Page.find(params[:id])
  end

  def new
  end

  def create
    @page=Page.new(pages_params)
   if @page.save
    redirect_to(:action=>'index')
    flash[:notice] = "Successfully Created."
   else
    render('edit')
   end
  end

  def delete
     @page=Page.find(params[:id])
  end

  def destroy
     @page=Page.find(params[:id])
     @page.destroy
     flash[:notice] = "Successfully Deleted."
     redirect_to(:action=>'index')
  end

  def edit
    @page=Page.find(params[:id])
  end

  def update
   @page=Page.find(params[:id])
   @page.update_attributes(pages_params)
   if @page.save
    redirect_to(:action=>'show',:id=>@page.id)
    flash[:notice] = "Successfully updated."
   else
    render('edit')
   end
  end
  private
  def pages_params
    #subject_id is the foreign key reference from subjects table
    params.require(:page).permit(:subject_id,:name,:permalink,:position,:visible)
  end
end
