context("punctuation cleaning")

test_that("quote cleaning", {
  expect_equal(clean_punc(vec = intToUtf8(8243)), '"')
  expect_equal(clean_punc(vec = intToUtf8(8246)), '"')
  expect_equal(clean_punc(vec = paste0(intToUtf8(171), intToUtf8(32))), '"')
  expect_equal(clean_punc(vec = paste0(intToUtf8(32), intToUtf8(187))), '"')
  expect_equal(clean_punc(vec = intToUtf8(8220)), '"')
  expect_equal(clean_punc(vec = intToUtf8(8221)), '"')
  expect_equal(clean_punc(vec = intToUtf8(96)), '"')
  expect_equal(clean_punc(vec = intToUtf8(180)), '"')
  expect_equal(clean_punc(vec = intToUtf8(8222)), '"')
  expect_equal(clean_punc(vec = intToUtf8(8220)), '"')
})

test_that("apostrophe cleaning", {
  expect_equal(clean_punc(vec = intToUtf8(1370)), "'")
  expect_equal(clean_punc(vec = intToUtf8(65040)), "'")
  expect_equal(clean_punc(vec = intToUtf8(8217)), "'")
})

test_that("dot dot dot cleaning", {
  expect_equal(clean_punc(vec = intToUtf8(8230)), "...")
})

