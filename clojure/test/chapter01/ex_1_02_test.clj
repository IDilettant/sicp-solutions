(ns chapter01.ex-1-02-test
  (:require [clojure.test :refer [deftest is testing]]
            [solutions.chapter01.ex-1-02 :as src]))

(deftest solution-test
  (testing "solution equals the expected rational"
    (is (= -37/150 src/solution))))
