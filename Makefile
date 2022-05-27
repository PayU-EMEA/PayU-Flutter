.PHONY: clean
clean:
	sh scripts/clean.sh payu_about
	sh scripts/clean.sh payu_add_card
	sh scripts/clean.sh payu_api
	sh scripts/clean.sh payu_core
	sh scripts/clean.sh payu_mastercard_installments
	cd payu_mobile_payments && sh ../scripts/clean.sh payu_mobile_payments_platform_interface && cd ../
	cd payu_mobile_payments && sh ../scripts/clean.sh payu_mobile_payments_android && cd ../
	cd payu_mobile_payments && sh ../scripts/clean.sh payu_mobile_payments_ios && cd ../
	cd payu_mobile_payments && sh ../scripts/clean.sh payu_mobile_payments && cd ../
	sh scripts/clean.sh payu_payment_methods
	sh scripts/clean.sh payu_state_management
	sh scripts/clean.sh payu_terms_and_conditions
	sh scripts/clean.sh payu_three_ds
	sh scripts/clean.sh payu_translations
	sh scripts/clean.sh payu_web_payments

	sh scripts/clean.sh payu
	sh scripts/clean.sh example

.PHONY: setup
setup:
	sh scripts/setup.sh payu_about
	sh scripts/setup.sh payu_add_card
	sh scripts/setup.sh payu_api
	sh scripts/setup.sh payu_core
	sh scripts/setup.sh payu_mastercard_installments
	cd payu_mobile_payments && sh ../scripts/setup.sh payu_mobile_payments_platform_interface && cd ../
	cd payu_mobile_payments && sh ../scripts/setup.sh payu_mobile_payments_android && cd ../
	cd payu_mobile_payments && sh ../scripts/setup.sh payu_mobile_payments_ios && cd ../
	cd payu_mobile_payments && sh ../scripts/setup.sh payu_mobile_payments && cd ../
	sh scripts/setup.sh payu_payment_methods
	sh scripts/setup.sh payu_state_management
	sh scripts/setup.sh payu_terms_and_conditions
	sh scripts/setup.sh payu_three_ds
	sh scripts/setup.sh payu_translations
	sh scripts/setup.sh payu_web_payments

	sh scripts/setup.sh payu
	sh scripts/setup.sh example

.PHONY: setup_dev
setup_dev:
	sh scripts/setup_dev.sh payu_about
	sh scripts/setup_dev.sh payu_add_card
	sh scripts/setup_dev.sh payu_api
	sh scripts/setup_dev.sh payu_core
	sh scripts/setup_dev.sh payu_mastercard_installments
	cd payu_mobile_payments && sh ../scripts/setup_dev.sh payu_mobile_payments_platform_interface && cd ../
	cd payu_mobile_payments && sh ../scripts/setup_dev.sh payu_mobile_payments_android && cd ../
	cd payu_mobile_payments && sh ../scripts/setup_dev.sh payu_mobile_payments_ios && cd ../
	cd payu_mobile_payments && sh ../scripts/setup_dev.sh payu_mobile_payments && cd ../
	sh scripts/setup_dev.sh payu_payment_methods
	sh scripts/setup_dev.sh payu_state_management
	sh scripts/setup_dev.sh payu_terms_and_conditions
	sh scripts/setup_dev.sh payu_three_ds
	sh scripts/setup_dev.sh payu_translations
	sh scripts/setup_dev.sh payu_web_payments

	sh scripts/setup.sh payu
	sh scripts/setup.sh example

.PHONY: tests
tests:
	sh scripts/test.sh payu_about
	sh scripts/test.sh payu_add_card
	sh scripts/test.sh payu_api
	sh scripts/test.sh payu_core
	sh scripts/test.sh payu_mastercard_installments
	cd payu_mobile_payments && sh ../scripts/test.sh payu_mobile_payments_platform_interface && cd ../
	cd payu_mobile_payments && sh ../scripts/test.sh payu_mobile_payments_android && cd ../
	cd payu_mobile_payments && sh ../scripts/test.sh payu_mobile_payments_ios && cd ../
	cd payu_mobile_payments && sh ../scripts/test.sh payu_mobile_payments && cd ../
	sh scripts/test.sh payu_payment_methods
	sh scripts/test.sh payu_terms_and_conditions
	sh scripts/test.sh payu_three_ds
	sh scripts/test.sh payu_translations
	sh scripts/test.sh payu_web_payments