class MainsController < ApplicationController
	def index
	end
	def login
		user=User.find_by email:params[:email]
		if user && user.authenticate(params[:password])
			session[:id] = user.id
			redirect_to '/professional_profile/'
		elsif user
			flash[:logerror]= "Your password does not match our records"
			redirect_to '/main/'
		else
			flash[:logerror]= "Email address not found"
			redirect_to '/main/'
		end
	end
	def logout
		session[:id]=nil
		redirect_to '/main/'
	end
	def profile
		@user=User.find(session[:id])
		@invitations=Invitation.where("invitee_id=?", User.find(session[:id]))
		@friends=@user.friends
		@friends_with=Friendship.where("friend_id=(?)", User.find(session[:id]))
	end
	def connect
		invite = Invitation.create(user:User.find(session[:id]), invitee:User.find(params[:id]))
		puts invite
		redirect_to '/users/'
	end
	def accept
		Friendship.create(user:User.find(params[:id]), friend:User.find(session[:id]))
		invite = Invitation.find_by user:(params[:id]), invitee:(session[:id])
		invite.destroy
		redirect_to '/professional_profile/'
	end
	def ignore
		Invitation.find(params[:id]).destroy
		redirect_to '/professional_profile/'
	end
end
