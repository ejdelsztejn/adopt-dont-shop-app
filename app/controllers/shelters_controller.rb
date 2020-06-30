class SheltersController < ApplicationController
  def index
    @shelters = ['Old Dog Haven', 'Leave No Paws Behind', "Blind Cat Rescue"]
  end

  def new
  end

  def create
  end
end
