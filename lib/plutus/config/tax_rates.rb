module Plutus
  TAX_RATES = {
    (0..18_200)                => { base_tax_amount:      0, tax_rate: 0 },
    (18_201..37_000)           => { base_tax_amount:      0, tax_rate: 0.19 },
    (37_001..80_000)           => { base_tax_amount:  3_572, tax_rate: 0.325 },
    (80_001..180_000)          => { base_tax_amount: 17_547, tax_rate: 0.37 },
    (180_001..Float::INFINITY) => { base_tax_amount: 54_547, tax_rate: 0.45 }
  }.freeze
end
