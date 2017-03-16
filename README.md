# MONEE gem
### because "Money" is already taken and it sounds almost the same :)

`gem install ./monee-0.0.1.gem`

and then run in `irb` together with `require 'monee'`

## USAGE
It covers the described functionality with exact same method names, just the namespacing is different, eg:

`Monee::Money.conversion_rates("EUR", { "PLN" => 4.35 })`
`Monee::Money.new(10, "EUR")`

## TESTING
just run `rspec` in the directory

## NOTES
since it's the simplest functionality, the conversion rates don't work in reverse. So to convert and make reversible math operations on different currencies, it's necessary to add them separately:

`Monee::Money.conversion_rates("EUR", { "PLN" => 4.35 })`
`Monee::Money.conversion_rates("PLN", { "EUR" => 0.23 })`

There no comments on purpose - I believe that good structure and method naming is enough.
