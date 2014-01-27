class MainController < ApplicationController
  def index
  end

  def process_text
    data = nil

    IO.popen ENV['TOOL'], "r+" do |io|
      io.write "#{params[:title]}###{params[:abstract]}"
      io.close_write
      data = io.read
    end

    result = data.split("\n").map do |str_pair|
      entry = { ids: str_pair.split(" ").map { |x| x.to_i } }
      entry[:text] = [
        AREAS_NAMES[entry[:ids][0]],
        STREAM_NAMES[entry[:ids][1]]
      ]
      entry
    end
  
    respond_to do |format|
      format.json { render json: result } 
    end
  end

  def save_result
    IO.popen "#{ENV['TOOL']} --result", "r+" do |io|
      io.write "#{params[:title]}###{params[:abstarct]}###{params[:area_id]} #{params[:stream_id]}"
      io.close_write
    end

    respond_to do |format|
      format.json { render json: {result: "Ok!"} } 
    end
  end
end
