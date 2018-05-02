class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  def new
  end

  def show
    if params['id'] && params['id'].to_i != 0
      @gossip = Gossip.find(params['id'])
      @comments = Comment.where("gossip_id="+ params['id'])
      p @comments
    else
      redirect_to action: "index"
    end
  end

  def create
    gossip = Gossip.create(anonymous_author: params['anonymous_author'], content: params['content'])
    
    if gossip.valid? == true
      gossip.save
      redirect_to action: "show", id: gossip.id
    else
      redirect_to action: "new"
    end
  end

  def edit
    if params['id'] && params['id'].to_i != 0
      @gossip = Gossip.find(params['id'])
    else
      redirect_to action: "index"
    end
  end

  def update
    @gossip = Gossip.find(params[:id])
    @gossip.update(anonymous_author: params[:anonymous_author], content: params[:content])
    @gossip.save!
    redirect_to action: "show", id: @gossip.id
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to action: "index"
  end
end
