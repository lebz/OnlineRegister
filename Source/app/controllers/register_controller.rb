class RegisterController < ApplicationController

	http_basic_authenticate_with name: "admin", password: "admin", only: :list

  def new
		@error = params[:error]
  end
  
  def create
		@register_data = RegisterData.new(register_data_params)
		@a = @register_data.name.to_s.length > 0
		@b = @register_data.year.to_s.length > 0
		@c = @register_data.major.to_s.length > 0
		@d = @register_data.mobile.to_s.length > 0
		@e = @register_data.email.to_s.length > 0
		if @a && @b && @c && @d && @e
			@register_data.save
			@id = @register_data.id
			redirect_to "/show?id=#{@id}"
		else 
			redirect_to "/?error=true"
		end
  end

	def show
		begin
			@register_data = RegisterData.find(params[:id])
		rescue
			@error = true
		end
	end
	
	def list
		@all_regiter = RegisterData.all
	end
	
	def destory
		begin
			@message = RegisterData.find(params[:id])
			@message.delete
		rescue
		end
		redirect_to "/list"
	end
	
	private 
	def register_data_params
		params.require(:register).permit(:name, :year, :major, :mobile, :email)
	end

end
