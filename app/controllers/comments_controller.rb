class CommentsController < ApplicationController
  def index
  end

  def new
  end

  def create
    gossip = Gossip.find(params['gossip'].to_i)
    comment = gossip.comments.create(anonymous_commentor: params['anonymous_commentor'], body: params['body'])
    comment.save!
    if comment.valid? == true
      redirect_to gossip_path(params[:gossip])
    else
      redirect_to gossip_path(params[:gossip])
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to "/gossips/"
  end
end
