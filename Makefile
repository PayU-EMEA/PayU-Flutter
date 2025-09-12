.PHONY: clean setup setup_dev tests

help: Makefile
	@sed -n "s/^##//p" $<

## ➡️ clean: Run `flutter clean` for all Packages 
clean:
	scripts/clean.sh payu_add_card
	scripts/clean.sh payu_api
	scripts/clean.sh payu_core
	scripts/clean.sh payu_mobile_payments/payu_mobile_payments_platform_interface
	scripts/clean.sh payu_mobile_payments/payu_mobile_payments_android
	scripts/clean.sh payu_mobile_payments/payu_mobile_payments_ios
	scripts/clean.sh payu_mobile_payments/payu_mobile_payments
	scripts/clean.sh payu_payment_methods
	scripts/clean.sh payu_state_management
	scripts/clean.sh payu_terms_and_conditions
	scripts/clean.sh payu_three_ds
	scripts/clean.sh payu_translations
	scripts/clean.sh payu_ui
	scripts/clean.sh payu_web_payments

	scripts/clean.sh payu
	scripts/clean.sh example

## ➡️ setup: Run `flutter pub get` for all Packages
setup:
	scripts/setup.sh payu_add_card
	scripts/setup.sh payu_api
	scripts/setup.sh payu_core
	scripts/setup.sh payu_mobile_payments/payu_mobile_payments_platform_interface
	scripts/setup.sh payu_mobile_payments/payu_mobile_payments_android
	scripts/setup.sh payu_mobile_payments/payu_mobile_payments_ios
	scripts/setup.sh payu_mobile_payments/payu_mobile_payments
	scripts/setup.sh payu_payment_methods
	scripts/setup.sh payu_state_management
	scripts/setup.sh payu_terms_and_conditions
	scripts/setup.sh payu_three_ds
	scripts/setup.sh payu_translations
	scripts/setup.sh payu_ui
	scripts/setup.sh payu_web_payments

	scripts/setup.sh payu
	scripts/setup.sh example

## ➡️ upgrade: Run `flutter pub upgrade && flutter pub run dependency_validator` for all Packages
upgrade:
	scripts/upgrade.sh payu_add_card
	scripts/upgrade.sh payu_api
	scripts/upgrade.sh payu_core
	scripts/upgrade.sh payu_mobile_payments/payu_mobile_payments_platform_interface
	scripts/upgrade.sh payu_mobile_payments/payu_mobile_payments_android
	scripts/upgrade.sh payu_mobile_payments/payu_mobile_payments_ios
	scripts/upgrade.sh payu_mobile_payments/payu_mobile_payments
	scripts/upgrade.sh payu_payment_methods
	scripts/upgrade.sh payu_state_management
	scripts/upgrade.sh payu_terms_and_conditions
	scripts/upgrade.sh payu_three_ds
	scripts/upgrade.sh payu_translations
	scripts/upgrade.sh payu_ui
	scripts/upgrade.sh payu_web_payments

	scripts/upgrade.sh payu
	scripts/upgrade.sh example

## ➡️ setup_dev: Run `flutter pub get && flutter pub upgrade && flutter pub run dependency_validator` for all Packages and validates dependencies
setup_dev:
	scripts/setup_dev.sh payu_add_card
	scripts/setup_dev.sh payu_api
	scripts/setup_dev.sh payu_core
	scripts/setup_dev.sh payu_mobile_payments/payu_mobile_payments_platform_interface
	scripts/setup_dev.sh payu_mobile_payments/payu_mobile_payments_android
	scripts/setup_dev.sh payu_mobile_payments/payu_mobile_payments_ios
	scripts/setup_dev.sh payu_mobile_payments/payu_mobile_payments
	scripts/setup_dev.sh payu_payment_methods
	scripts/setup_dev.sh payu_state_management
	scripts/setup_dev.sh payu_terms_and_conditions
	scripts/setup_dev.sh payu_three_ds
	scripts/setup_dev.sh payu_translations
	scripts/setup_dev.sh payu_ui
	scripts/setup_dev.sh payu_web_payments

	scripts/setup_dev.sh payu
	scripts/setup_dev.sh example

## ➡️ build: Run `flutter pub run build_runner build` for all Packages
build:
	scripts/build.sh payu_add_card
	scripts/build.sh payu_api
	scripts/build.sh payu_core
	scripts/build.sh payu_mobile_payments/payu_mobile_payments_platform_interface
	scripts/build.sh payu_mobile_payments/payu_mobile_payments_android
	scripts/build.sh payu_mobile_payments/payu_mobile_payments_ios
	scripts/build.sh payu_mobile_payments/payu_mobile_payments
	scripts/build.sh payu_payment_methods
	scripts/build.sh payu_state_management
	scripts/build.sh payu_terms_and_conditions
	scripts/build.sh payu_three_ds
	scripts/build.sh payu_translations
	scripts/build.sh payu_ui
	scripts/build.sh payu_web_payments

	scripts/build.sh payu
	scripts/build.sh example

## ➡️ analyze: Run `flutter analyze` for all Packages
analyze:
	scripts/analyze.sh payu_add_card
	scripts/analyze.sh payu_api
	scripts/analyze.sh payu_core
	scripts/analyze.sh payu_mobile_payments/payu_mobile_payments_platform_interface
	scripts/analyze.sh payu_mobile_payments/payu_mobile_payments_android
	scripts/analyze.sh payu_mobile_payments/payu_mobile_payments_ios
	scripts/analyze.sh payu_mobile_payments/payu_mobile_payments
	scripts/analyze.sh payu_payment_methods
	scripts/analyze.sh payu_state_management
	scripts/analyze.sh payu_terms_and_conditions
	scripts/analyze.sh payu_three_ds
	scripts/analyze.sh payu_translations
	scripts/analyze.sh payu_ui
	scripts/analyze.sh payu_web_payments

	scripts/analyze.sh payu
	scripts/analyze.sh example

## ➡️ to_local: Switch PayU dependencies to local
to_local:
	scripts/switch_dev.sh payu_add_card local
	scripts/switch_dev.sh payu_api local
	scripts/switch_dev.sh payu_core local
	scripts/switch_dev.sh payu_mobile_payments/payu_mobile_payments local
	scripts/switch_dev.sh payu_payment_methods local
	scripts/switch_dev.sh payu_state_management local
	scripts/switch_dev.sh payu_terms_and_conditions local
	scripts/switch_dev.sh payu_three_ds local
	scripts/switch_dev.sh payu_translations local
	scripts/switch_dev.sh payu_ui local
	scripts/switch_dev.sh payu_web_payments local
	scripts/switch_dev.sh payu local
	scripts/switch_dev.sh example local

## ➡️ to_git: Switch PayU dependencies to git
to_git:
	scripts/switch_dev.sh payu_add_card git
	scripts/switch_dev.sh payu_api git
	scripts/switch_dev.sh payu_core git
	scripts/switch_dev.sh payu_mobile_payments/payu_mobile_payments git
	scripts/switch_dev.sh payu_payment_methods git
	scripts/switch_dev.sh payu_state_management git
	scripts/switch_dev.sh payu_terms_and_conditions git
	scripts/switch_dev.sh payu_three_ds git
	scripts/switch_dev.sh payu_translations git
	scripts/switch_dev.sh payu_ui git
	scripts/switch_dev.sh payu_web_payments git
	scripts/switch_dev.sh payu git
	scripts/switch_dev.sh example git

## ➡️ tests: Run tests for all Packages
tests:
	@fail=0; \
	for pkg in \
		payu_add_card \
		payu_api \
		payu_core \
		payu_mobile_payments/payu_mobile_payments_platform_interface \
		payu_payment_methods \
		payu_terms_and_conditions \
		payu_three_ds \
		payu_web_payments \
	; do \
		echo "Running tests for $$pkg..."; \
		scripts/test.sh $$pkg || fail=1; \
	done; \
	exit $$fail
