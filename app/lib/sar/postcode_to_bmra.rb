module SAR
  class PostcodeToBmra
    def initialize(postcode)
      @postcode = postcode
    end

    def convert
      if bmra_by_postcode
        { status: 'found',
          bmra: bmra_by_postcode.bmra,
          name: bmra_by_postcode.name }
      else
        { status: 'not_found' }
      end
    end

    private

    attr_reader :postcode

    def normalized_postcode
      postcode[0..-3].gsub(/[^0-9a-z]/i, '').upcase
    end

    def bmra_by_postcode
      @result ||= Postcode2Bmra.find_by(postcode: normalized_postcode)
    end
  end
end
