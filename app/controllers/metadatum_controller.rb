class MetadatumController < ApplicationController
  def show
    @metadatum = Metadatum.find(params[:id])
  end
end
