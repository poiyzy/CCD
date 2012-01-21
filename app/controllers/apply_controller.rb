class ApplyController < ApplicationController
  layout 'apply'

  def index
  end
  
  def created
    @apply = Applicant.new do |a|
      a.name = params[:name]
      a.phone = params[:phone]
      a.email = params[:email]
      a.school = params[:school]
      a.grate = params[:grate]
      a.sex = params[:sex]
      a.tel = params[:tel]
      a.address = params[:address]
      a.birth = params[:birth]
      a.idcard = params[:idcard]
      a.pname = params[:pname]
    end
    
    if @apply.save
      redirect_to apply_index_path
    else
      render :index
    end
    
  end
end
