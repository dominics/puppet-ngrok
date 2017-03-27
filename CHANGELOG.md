# CHANGELOG

## 2.0.0-unreleased
- breaking: split the management of the config file to a define, so more than one user's config can be managed
- breaking: no longer provide $dependencies parameter
- major: add a dependency on puppet/archive for downloading and extracting the ngrok zip, supports checksums

## 1.1.0
- bugfix: ensure config folder exists
- meta: add tests
- meta: cleanup module

## 1.0.1
- meta: enable auto-testing
- meta: update requirements and compatibility
- minor: fix typos

## 1.0.0
- initial release
