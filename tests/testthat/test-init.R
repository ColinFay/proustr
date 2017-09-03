context("init")
test_that("book tibble is created", {
  pb_df <- proust_books()
  expect_equal(nrow(pb_df), 4690)
  expect_equal(length(pb_df), 4)
  expect_true(inherits(pb_df, "data.frame"))
  expect_true(inherits(pb_df, "tbl_df"))
  expect_true(inherits(pb_df, "tbl"))
})

context("df creation")

test_that("characters tibble is created", {
  pc_df <- proust_characters()
  expect_equal(nrow(pc_df), 823)
  expect_equal(length(pc_df), 3)
  expect_true(inherits(pc_df, "data.frame"))
  expect_true(inherits(pc_df, "tbl_df"))
  expect_true(inherits(pc_df, "tbl"))
})


