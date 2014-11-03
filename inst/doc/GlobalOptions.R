## ----eval = TRUE, echo = TRUE--------------------------------------------
library(GlobalOptions)
foo.options = setGlobalOptions(
    a = 1,
    b = "text"
)

## ------------------------------------------------------------------------
foo.options()
foo.options("a")
op = foo.options()
op
foo.options(a = 2, b = "new text")
foo.options()
foo.options(op)
foo.options()

## ------------------------------------------------------------------------
foo.options(a = 2, b = "new text")
foo.options(RESET = TRUE)
foo.options()

## ------------------------------------------------------------------------
foo.options = setGlobalOptions(
    a = list(.value = 1,
             .length = c(1, 3),
             .class = "numeric")
)

## ------------------------------------------------------------------------
foo.options = setGlobalOptions(
    a = list(.value = 1,
             .read.only = TRUE),
    b = 2
)
foo.options()
foo.options(READ.ONLY = TRUE)
foo.options(READ.ONLY = FALSE)

## ------------------------------------------------------------------------
foo.options = setGlobalOptions(
    verbose = 
        list(.value = TRUE,
             .filter = function(x) {
                 if(is.null(x)) {
                     return(FALSE)
                 } else if(is.na(x)) {
                     return(FALSE)
                 } else {
                     return(x)
                 }
              })
)
foo.options(verbose = FALSE); foo.options("verbose")
foo.options(verbose = NA); foo.options("verbose")
foo.options(verbose = NULL); foo.options("verbose")

## ------------------------------------------------------------------------
foo.options = setGlobalOptions(
    prefix = ""
)
foo.options(prefix = function() paste("[", Sys.time(), "] ", sep = " "))
foo.options("prefix")
Sys.sleep(2)
foo.options("prefix")

## ------------------------------------------------------------------------
foo.options = setGlobalOptions(
    test = list(.value = function(x1, x2) t.test(x1, x2)$p.value,
                .class = "function")
)
foo.options(test = function(x1, x2) cor.test(x1, x2)$p.value)
foo.options("test")

## ------------------------------------------------------------------------
foo.options = setGlobalOptions(
    a = list(.value = 1),
    b = list(.value = function() 2 * OPT$a)
)
foo.options("b")
foo.options(a = 2)
foo.options("b")

## ------------------------------------------------------------------------
foo.options = setGlobalOptions(
	a = list(.value = 1,
	         .visible = FALSE),
	b = 2
)
foo.options()
foo.options("a")
foo.options(a = 2)
foo.options("a")

## ------------------------------------------------------------------------
args(foo.options)

## ------------------------------------------------------------------------
foo.options1 = setGlobalOptions(
    a = list(.value = 1)
)
foo.options2 = setGlobalOptions(
    a = list(.value = 1)
)
foo.options1(a = 2)
foo.options1("a")
foo.options2("a")

