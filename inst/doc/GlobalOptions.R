### R code from vignette source 'GlobalOptions.Rnw'

###################################################
### code chunk number 1: GlobalOptions.Rnw:24-29
###################################################
library(GlobalOptions)
foo.options = setGlobalOptions(
    a = 1,
    b = "text"
)


###################################################
### code chunk number 2: GlobalOptions.Rnw:35-43
###################################################
foo.options()
foo.options("a")
op = foo.options()
op
foo.options(a = 2, b = "new text")
foo.options()
foo.options(op)
foo.options()


###################################################
### code chunk number 3: GlobalOptions.Rnw:49-52
###################################################
foo.options(a = 2, b = "new text")
foo.options(RESET = TRUE)
foo.options()


###################################################
### code chunk number 4: GlobalOptions.Rnw:58-63
###################################################
foo.options = setGlobalOptions(
    a = list(.value = 1,
             .length = c(1, 3),
             .class = "numeric")
)


###################################################
### code chunk number 5: GlobalOptions.Rnw:104-112
###################################################
foo.options = setGlobalOptions(
    a = list(.value = 1,
             .read.only = TRUE),
    b = 2
)
foo.options()
foo.options(READ.ONLY = TRUE)
foo.options(READ.ONLY = FALSE)


###################################################
### code chunk number 6: GlobalOptions.Rnw:140-156
###################################################
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


###################################################
### code chunk number 7: GlobalOptions.Rnw:163-170
###################################################
foo.options = setGlobalOptions(
    prefix = ""
)
foo.options(prefix = function() paste("[", Sys.time(), "] ", sep = " "))
foo.options("prefix")
Sys.sleep(2)
foo.options("prefix")


###################################################
### code chunk number 8: GlobalOptions.Rnw:176-182
###################################################
foo.options = setGlobalOptions(
    test = list(.value = function(x1, x2) t.test(x1, x2)$p.value,
                .class = "function")
)
foo.options(test = function(x1, x2) cor.test(x1, x2)$p.value)
foo.options("test")


###################################################
### code chunk number 9: GlobalOptions.Rnw:190-195
###################################################
foo.options = setGlobalOptions(
    a = list(.value = 1),
    b = list(.value = function() 2 * OPT$a)
)
foo.options("b")


###################################################
### code chunk number 10: GlobalOptions.Rnw:229-238
###################################################
foo.options1 = setGlobalOptions(
    a = list(.value = 1)
)
foo.options2 = setGlobalOptions(
    a = list(.value = 1)
)
foo.options1(a = 2)
foo.options1("a")
foo.options2("a")


###################################################
### code chunk number 11: GlobalOptions.Rnw:245-246
###################################################
args(foo.options)


