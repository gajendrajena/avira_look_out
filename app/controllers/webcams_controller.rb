class WebcamsController < ApplicationController
  before_action :set_webcam, only: [:show, :edit, :update, :destroy]

  # GET /webcams/1
  # GET /webcams/1.json
  def show
    render json: {image: asset_path(@webcam.get_image(params[:pic_id]))}, status: 200
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_webcam
      @webcam = Webcam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def webcam_params
      params.require(:webcam).permit(:name)
    end
end
