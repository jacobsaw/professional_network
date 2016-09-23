class UsersController < ApplicationController
	def index
		@users=User.where.not("id=?", session[:id])
		@user = User.find(session[:id])
		@friends_with=Friendship.where("friend_id=(?)", User.find(session[:id]))
		@invited_by=Invitation.where("invitee_id=(?)", User.find(session[:id]))
	end
	def new
		user=User.new(user_params)
		if user.save
			session[:id] = user.id
			redirect_to '/professional_profile/'
		else
			print user.errors.full_messages
			flash[:errors]=user.errors.full_messages
			redirect_to '/main/'
		end
	end
	def show
		@user=User.find(params[:id])
	end
	private
	def user_params
		params.require(:users).permit(:name, :email, :password, :password_confirmation, :description)
	end
end
