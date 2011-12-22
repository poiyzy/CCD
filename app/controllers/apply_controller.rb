class ApplyController < ApplicationController
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
    
    @apply.save!
    
    redirect_to apply_index_path
  end
end
