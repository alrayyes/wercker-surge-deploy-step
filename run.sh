#!/bin/sh

# return true if local npm package is installed at ./node_modules, else false
# example
# echo "surge : $(npm_package_is_installed surge)"
function npm_package_is_installed {
  # set to true initially
  local return_=true
  # set to false if not found
  ls node_modules | grep $1 >/dev/null 2>&1 || { local return_=false; }
  # return value
  echo "$return_"
}

# First make sure surge is installed
if ! type surge &> /dev/null ; then
    # Check if it is in repo
    if ! $(npm_package_is_installed surge) ; then
        info "surge not installed, trying to install it through npm"

        if ! type npm &> /dev/null ; then
            fail "npm not found, make sure you have npm or surge installed"
        else
            info "npm is available"
            debug "npm version: $(npm --version)"

            info "installing surge"
            npm config set ca "" --silent
            sudo npm install npm -g --silent
            sudo npm install -g --silent surge
            surge_command="surge"
        fi
    else
        info "surge is available locally"
        debug "surge version: $( node ./node_modules/.bin/surge --version)"
        surge_command=" node ./node_modules/.bin/surge"
    fi
else
    info "surge is available"
    debug "surge version: $(surge --version)"
    surge_command="surge"
fi

surge_command ="$surge_command $WERCKER_SURGE_DIRECTORY $WERCKER_SURGE_DOMAIN --token $WERCKER_SURGE_TOKEN"

debug "$surge_command"

set +e
$surge_command
result="$?"
set -e

# Fail if it is not a success or warning
if [[ result -ne 0 && result -ne 6 ]]
then
    warn "$result"
    fail "surge command failed"
else
    success "finished $surge_command"
fi