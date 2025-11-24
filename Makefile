run:
	./scripts/run_ex_solution.sh  "$(ex)" "$(lang)"

test:
	./scripts/run_ex_test.sh "$(ex)" "$(lang)"

.PHONY: run test
