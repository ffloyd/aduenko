class MainController < ApplicationController
  def index
  end

  def process_text
    result = []
    20.times do
      result.push({ids: [1, 1], text: ['ssssss', 'ddd']})
    end

    respond_to do |format|
      format.json { render json: result } 
    end
  end

  def save_result
    respond_to do |format|
      format.json { render json: {result: "Ok!"} } 
    end
  end
end
