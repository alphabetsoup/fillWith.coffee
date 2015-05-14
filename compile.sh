#!/usr/bin/env bash
rm js/fillWith.js js/tests.js
coffee --compile --output js coffee/fillWith.coffee
coffee --compile --output js  coffee/tests.coffee
