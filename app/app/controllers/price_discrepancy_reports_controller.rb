class PriceDiscrepancyReportsController < ApplicationController
  def index
  end

  def show
    brma = SAR::BRMA::FindByPostcode.new(params[:postcode]).convert

    render json: {
      brma: brma[:name],
      government_allowance: 590,
      results: {
        spareroom: {
          total_results: 1099,
          highest_rent: 830,
          lowest_rent: 80,
          mean_rent: 394,
          median_rent: 215,
          rooms_below_threshold: 5
        }
      },
      number_rooms: 1099,
      rooms_below_threshhold: 5
  }
  end
end
