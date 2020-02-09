# Moneys3Statements

Generates XML with bank movements for importing into Money S3.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'moneys3_statements'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install moneys3_statements

## Usage

Instantiate `MoneyS3Statements` with hash containing statements config:
```
config = {
  my_bank_account_id: 'BAN', # Czech: zkratka bankovniho uctu
  credit_transactions_rule: 'BP001', # Czech: predkontace pro prijmy
  debit_transactions_rule: 'BV001', # Czech: predkontace pro vydaje
  credit_transactions_vat_rule: '19Ř00U', # Czech: cleneni dph pro prijmy
  debit_transactions_vat_rule: '19Ř00P', # Czech: cleneni dph pro vydaje
  credit_transactions_series: 'BPrr', # Czech: ciselna rada prijmovych bankovnich dokladu
  debit_transactions_series: 'BVrr' # Czech: ciselna rada vydajovych bankovnich dokladu
}
generator = MoneyS3Statements.new(config)
```

Then call `#to_xml` on the generator and pass it an array containing hashes with movement data:
```
transactions = [
  { :date => #<Date: 2019-12-05 ((2458823j,0s,0n),+0s,2299161j)>,
    :transaction_id => "121205SI201442",
    :amount => 8500.0,
    :statement_id => "012/00001",
    :variable_symbol => "0000112019",
    :specific_symbol => "",
    :constant_symbol => "0000000138",
    :counterparty_account => "1023706843",
    :counterparty_bank_code => "0100",
    :type => :debit, # or :credit for credit transactions
    :description => "Some description.." },
    ...,
    ...
]
statements_string = generator.to_xml(transactions)
File.open("statements.xml", 'wb') { |f| f.write statements_string }
```

Then import into Money.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
