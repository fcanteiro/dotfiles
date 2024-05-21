# Local Server (Using Herd)
alias php81="~/Library/Application\ Support/Herd/bin/php81"
alias php82="~/Library/Application\ Support/Herd/bin/php82"
alias php83="~/Library/Application\ Support/Herd/bin/php83"
alias composer81="php81 ~/Library/Application\ Support/Herd/bin/composer"
alias composer82="php82 ~/Library/Application\ Support/Herd/bin/composer"
alias composer83="php83 ~/Library/Application\ Support/Herd/bin/composer"

# Laravel
alias vapor="~/.composer/vendor/laravel/vapor-cli/vapor"
alias art="php artisan"
alias artms="art migrate:status"
alias artm="art migrate --step"
alias artmrb="art migrate:rollback --step=1"
alias phpunit='./vendor/bin/phpunit'
alias sail='./vendor/bin/sail'
alias pint='./vendor/bin/pint'
alias pc='pint --dirty'
alias pint-changes='pint --dirty'
alias pint-changed='pint --dirty'
alias unused_scanner="~/.composer/vendor/insolita/unused-scanner/unused_scanner"
alias vapor.costs="vapor metrics production"
alias vapor.costs.month="vapor metrics production 1M"
alias vapor.costs.staging="vapor metrics staging"
alias vapor.costs.month.staging="vapor metrics staging 1M"
alias vds="vapor deploy staging"
alias vdsm="vapor deploy staging --message "
alias vdp="vapor deploy production"
alias vdpm="vapor deploy production --message "
alias art.transactions="art list | grep transactions"
