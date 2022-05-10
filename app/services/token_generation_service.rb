class TokenGenerationService

    def self.generate
        return SecureRandom.hex
    end
end
