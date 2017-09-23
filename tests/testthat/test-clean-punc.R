context("punctuation cleaning")

test_that("quote cleaning", {
  expect_equal(clean_punc(vec = "..."), "...")
  expect_equal(clean_punc(vec = "″"), '"')
  expect_equal(clean_punc(vec = "‶"), '"')
  expect_equal(clean_punc(vec = "« "), '"')
  expect_equal(clean_punc(vec = " »"), '"')
  expect_equal(clean_punc(vec = "“"), '"')
  expect_equal(clean_punc(vec = "”"), '"')
  expect_equal(clean_punc(vec = "`"), '"')
  expect_equal(clean_punc(vec = "´"), '"')
  expect_equal(clean_punc(vec = "„"), '"')
  expect_equal(clean_punc(vec = "“"), '"')
})

test_that("apostrophe cleaning", {
  expect_equal(clean_punc(vec = "՚"), "'")
  expect_equal(clean_punc(vec = "︐"), "'")
  expect_equal(clean_punc(vec = "’"), "'")
})

test_that("dot dot dot cleaning", {
  expect_equal(clean_punc(vec = "…"), "...")
})

