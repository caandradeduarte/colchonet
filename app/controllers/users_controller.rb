class UsersController < ApplicationController
	before_filter :can_change, :only => [:edit, :update]
	before_filter :require_no_authentication, :only => [:new, :create]

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])

		# if user_signed_in?
		# 	@user_review = @room.reviews.find_or_initialize_by_user_id(current_user.id)
		# end
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			SignupMailer.confirm_email(@user).deliver
			redirect_to @user, notice => 'Cadastro criado com sucesso!'
		else
			render :new
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			redirect_to @user, :notice => 'Cadastro atualizado com sucesso!'
		else
			render :edit
		end
	end

	private

	def can_change
		unless user_signed_in? && current_user == user
			redirect_to user_path(params[:id])
		end
	end

	def user
		@user ||= User.find(params[:id])
	end
end