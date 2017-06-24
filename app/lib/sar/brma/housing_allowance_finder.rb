require 'csv'

module SAR
  module BRMA
    class HousingAllowanceFinder
      def exec(brma_number)
        result = find_by(brma_number)

        {
          bmra_name: result['BRMAname'],
          lha_rate: result['LHArate'].to_f
        }
      end

      private

      def find_by(brma_number)
        @result_row ||= parsed_csv.find do |row|
          row['BRMAno'].to_i == brma_number
        end
      end

      def parsed_csv
        CSV.read(Rails.root.join('fixtures', 'brma.csv'), headers: true)
      end
    end
  end
end
