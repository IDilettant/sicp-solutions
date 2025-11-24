# Structure and Interpretation of Computer Programs

<details>
<summary>Chapter 1. Building Abstractions with Procedures</summary>
  
[Source](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-10.html#%25_thm_1.2)
  
  - <details>
      <summary>Exercise 1.2</summary>

    Translate the following expression into prefix form

    ```text
    (5 + 4 + (2 - (3 - (6 + 4/5)))) / (3 * (6 - 2) * (2 - 7))
    ```

    <details>
      <summary>Solution</summary>

      ```clojure

      (def solution
        (/ (+ 5
              4
              (- 2
                 (- 3
                    (+ 6
                       (/ 4 5)))))
           (* 3
              (- 6 2)
              (- 2 7))))

      ```

      ```bash
      # run: Run solution
      make run ex=1-02
      ```

    </details>
    <details>

      <summary>Tests</summary>

      ```clojure
      (deftest solution-test
        (testing "solution equals the expected rational"
          (is (= -37/150 src/solution))))
      ```

      ```bash
      # run: Run test
      make test ex=1-02
      ```

    </details>
    </details>

</details>
