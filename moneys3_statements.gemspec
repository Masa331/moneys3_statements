Gem::Specification.new do |spec|
  spec.name          = "moneys3_statements"
  spec.version       = '0.0.1'
  spec.authors       = ["Premysl Donat"]
  spec.email         = ["pdonat@seznam.cz"]
  spec.summary       = "Library for creating MoneyS3 xml bank statements for import."
  spec.homepage      = 'https://github.com/Masa331/moneys3_statements'
  spec.license       = "MIT"
  spec.files         = ['lib/moneys3_statements.rb']

  spec.add_dependency 'money_s3'
end
