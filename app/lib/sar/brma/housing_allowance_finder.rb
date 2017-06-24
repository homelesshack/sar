require 'csv'

module SAR
  module BRMA
    class HousingAllowanceFinder
      def exec(brma_number)
        result = find_by(brma_number)

        {
          bmra_name: result[NAME_INDEX],
          lha_rate: result[LHA_RATE_INDEX].to_f,
          max_rent: result[MAX_RENT_INDEX].to_f
        }
      end

      private

      NAME_INDEX = 2
      LHA_RATE_INDEX = 6
      MAX_RENT_INDEX = 5

      def find_by(brma_number)
        @result_row ||= parsed_csv.select do |row|
          row_number, _ = row
          row_number.to_i == brma_number
        end.flatten
      end

      def parsed_csv
        CSV.read(Rails.root.join('fixtures', 'brma.csv'))
      end
    end
  end
end
