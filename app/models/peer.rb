class Peer < ActiveRecord::Base
  attr_accessible :req_to_peer_id, :user_id
  belongs_to :user
end
